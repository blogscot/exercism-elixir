defmodule Flattener do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> Flattener.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> Flattener.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    flatten(list, [])
  end

  def flatten([], acc), do: acc
  def flatten([h|t], acc) do
    case h do
      nil -> flatten(t, acc)
      [] -> flatten(t, acc)
      [nil|xs] -> flatten([xs|t], acc)
      [[x]|xs] -> flatten([[x|xs] | t], acc)
      [x|[xs]] -> flatten([xs|t], acc ++ [x])
      [x|xs] -> flatten([xs|t], acc ++ [x])
      x -> flatten(t, acc ++ [x])
    end
  end

end
