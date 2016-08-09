defmodule Flattener do

  @spec flatten(list) :: list
  def flatten(list), do: flatten(list, [])

  defp flatten([], acc), do: acc
  defp flatten([h|t], acc) do
    case h do
      nil        -> flatten(t, acc)
      []         -> flatten(t, acc)
      [nil | xs] -> flatten([xs | t], acc)
      [[x] | xs] -> flatten([[x | xs] | t], acc)
      [x | [xs]] -> flatten([xs | t], acc ++ [x])
      [x | xs]   -> flatten([xs | t], acc ++ [x])
      x          -> flatten(t, acc ++ [x])
    end
  end
end
