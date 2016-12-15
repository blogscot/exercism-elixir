defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    Stream.iterate([1], &calculate_pascal_triangle/1) |> Enum.take(num)
  end

  defp calculate_pascal_triangle(array) do
    [0 | array]
    |> Enum.chunk(2, 1, [0])
    |> Enum.map(&Enum.sum/1)
  end

end
