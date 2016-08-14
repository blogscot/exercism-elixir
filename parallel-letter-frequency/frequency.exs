defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: %{}
  def frequency(texts, _worker) do
    frequency_spawn(texts)
    num_texts = length(texts)
    freq_collect(num_texts)
  end


  defp frequency_spawn(texts) do
    sender = self()
    texts
    |> Enum.each(fn text ->
      spawn(fn ->
        letter_freqs = parse_string(text)
        send(sender, {:freq, letter_freqs})
      end)
    end)
  end

  defp freq_collect(n) do
    Enum.reduce(1..n, %{}, fn _map, acc->
      receive do
        {:freq, freqs} -> merge(acc, freqs)
      end
    end)
  end

  defp merge(map1=%{}, map2=%{}) do
    Map.merge(map1, map2, fn _k, v1, v2 ->
      v1 + v2
    end)
  end

  defp remove_punctuation(string) do
    Regex.replace(~r/[\p{P}\s\d]+/, string, "")
  end

  defp parse_string(string) do
    string
    |> String.downcase
    |> remove_punctuation
    |> String.graphemes
    |> Enum.reduce(Map.new, fn letter, acc ->
      Map.update(acc, letter, 1, &(&1+1)) end)
  end

end
