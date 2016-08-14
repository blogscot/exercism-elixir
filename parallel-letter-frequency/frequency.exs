defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(texts, workers) do

    texts
    |> Enum.join
    |> String.downcase
    |> remove_punctuation
    |> String.graphemes
    |> Enum.reduce(Map.new, fn letter, dict ->
      Map.update(dict, letter, 1, &(&1+1)) end)
  end

  defp remove_punctuation(string) do
    Regex.replace(~r/[\p{P}\s\d]+/, string, "")
  end

end
