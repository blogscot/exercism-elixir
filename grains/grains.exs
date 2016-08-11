defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) do
    :math.pow(2, number-1) |> trunc
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    for s <- 1..64 do
      s |> square
    end
    |> Enum.sum
  end
end
