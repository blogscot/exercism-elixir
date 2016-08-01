defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &transcribe/1)
  end

  defp transcribe(nucleotide) do
    case nucleotide do
      ?A -> ?U
      ?C -> ?G
      ?T -> ?A
      ?G -> ?C
    end
  end
end
