defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }

  def kind(x, y, z) when x <= 0 or y <= 0 or z <= 0, do:
    { :error, "all side lengths must be positive" }
  def kind(a, a, a), do: {:ok, :equilateral}
  def kind(a, b, c) do
    [x, y, z] = Enum.sort([a, b, c])
    cond do
       x + y <= z -> { :error, "side lengths violate triangle inequality" }
       a == b or b == c or a == c -> { :ok, :isosceles }
      true -> { :ok, :scalene }
    end
  end
end
