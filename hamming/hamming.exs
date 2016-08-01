defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2), do:
    {:error, "Lists must be the same length."}
  def hamming_distance(strand1, strand2) do
    distance =
      (for {x, y} <- Stream.zip(strand1, strand2), do: x===y)
      |> Enum.filter(&(!&1))
      |> length
      {:ok, distance}
  end
end
