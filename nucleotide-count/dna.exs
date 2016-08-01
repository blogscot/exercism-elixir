defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless(nucleotide in @nucleotides and is_valid?(strand), do:
      raise(ArgumentError, message: "Invalid Argument"))

      strand |> Enum.filter(&(&1===nucleotide)) |> length
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    unless(is_valid?(strand), do:
      raise(ArgumentError, message: "Invalid Argument"))

    Map.new(@nucleotides, fn x -> {x, count(strand, x)} end)
  end

  defp is_valid?(strand), do:
    strand |> Enum.all?(&(Enum.member?(@nucleotides, &1)))
end
