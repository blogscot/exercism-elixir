defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn word ->
      normalize(word) === normalize(base) and String.downcase(word) !== base
     end)
  end

  defp normalize(string) do
    string
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end
end
