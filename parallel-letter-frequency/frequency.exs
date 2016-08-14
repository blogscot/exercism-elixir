defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: %{}
  def frequency(texts, workers) do
    pool = Enum.map(1..workers, fn _ -> spawn(&process_text/0) end)

    Enum.zip(texts, Stream.cycle(pool))
    |> Enum.map(&start_worker/1)
    |> Enum.map(&process_result/1)
    |> Enum.reduce(&merge/2)
  end

  defp start_worker({text, worker_pid}) do
    send(worker_pid, {:text, text, self})
  end

  defp process_result(_) do
    receive do
      {:freq, freqs} -> freqs
    end
  end

  defp merge(map1=%{}, map2=%{}) do
    Map.merge(map1, map2, fn _k, v1, v2 ->
      v1 + v2
    end)
  end

  def process_text do
    receive do
      {:text, text, from} -> letter_freqs = parse_string(text)
      send(from, {:freq, letter_freqs})
      process_text
    end
  end

  defp remove_punctuation(string) do
    Regex.replace(~r/[\p{P}\s\d]+/, string, "")
  end

  def parse_string(string) do
    string
    |> String.downcase
    |> remove_punctuation
    |> String.graphemes
    |> Enum.reduce(Map.new, fn letter, acc ->
      Map.update(acc, letter, 1, &(&1+1)) end)
  end

end
