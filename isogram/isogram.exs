defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    text = Regex.replace(~r/[\s-]+/, sentence, "")

    text
    |> String.graphemes
    |> Enum.uniq
    |> Enum.join
    |> Kernel.===(text)
  end

end
