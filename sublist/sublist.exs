defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare([], []), do: :equal
  def compare([x], [x]), do: :superlist
  def compare([], [_]), do: :sublist
  def compare([_], []), do: :superlist

  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a,b) -> :sublist
      contains?(b,a) -> :superlist
      true -> :unequal
    end
  end

  defp contains?(a,b), do: a in Enum.chunk(b, length(a), 1)
end
