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
    case a == b do
      true -> :equal
      _ -> case a in Enum.chunk(b, length(a), 1) do
            true -> :sublist
            false -> :unequal
           end
    end
    # a in Enum.chunk(b, length(a), 1)
  end
end


r = Sublist.compare([1,1,2], [1,1,1,2])
IO.inspect(r)


