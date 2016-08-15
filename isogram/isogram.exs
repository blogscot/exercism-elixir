defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> clean
    |> String.graphemes
    |> MapSet.new
    |> MapSet.size
    |> Kernel.===(sentence |> clean |> String.length)
  end

  defp clean(string), do: Regex.replace(~r/[\s-]+/, string, "")

end
