defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @size 7

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(white \\ {0,3}, black \\ {7,3})
  def new(white, black) when white == black, do: raise ArgumentError
  def new(white, black) do
    %Queens{white: white, black: black}
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    for row <- 0..@size do
      for col <- 0..@size do
        cond do
          queens.white == {row, col} -> if col == @size, do: "W", else: "W "
          queens.black == {row, col} -> if col == @size, do: "B", else: "B "
          true -> if col == @size, do: "_", else: "_ "
        end
      end
    end |> Enum.join("\n")
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{white: {wx,wy}, black: {bx,by}}) do
    {delta_x, delta_y} = {wx-bx |> abs , wy-by |> abs}
    cond do
      wx == bx -> true
      wy == by -> true
      delta_x == delta_y -> true
      true -> false
    end
  end
end
