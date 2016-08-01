defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if nucleotide in @nucleotides and is_valid?(strand), do:
      strand |> Enum.filter(&(&1===nucleotide)) |> length,
    else:
      raise(ArgumentError, message: "Invalid Argument")
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    if is_valid?(strand), do:
      %{?A => count(strand, ?A),
        ?T => count(strand, ?T),
        ?C => count(strand, ?C),
        ?G => count(strand, ?G),
      },
    else:
      raise(ArgumentError, message: "Invalid Argument")
  end

  defp is_valid?(strand), do:
    strand |> Enum.all?(&(Enum.member?(@nucleotides, &1)))
end
