defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    parse_binary(String.reverse(string) |> String.graphemes)
  end

  defp parse_binary(binary, position \\ 0, acc \\ 0)
  defp parse_binary([], _, acc), do: acc |> trunc
  defp parse_binary([h|rest], position, acc) do
    cond do
      h == "1" -> parse_binary(rest, position+1, acc + :math.pow(2, position))
      h == "0" -> parse_binary(rest, position+1, acc)
      true -> 0
    end
  end

end
