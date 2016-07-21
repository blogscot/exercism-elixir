defmodule Words do

  @spec count(String.t) :: map
  def count(sentence) do
    junk = ~r/[\s!@#$%^&:.,_]+/u
    sentence
    |> String.downcase
    |> String.split(junk, trim: true)
    |> Enum.reduce(Map.new, fn word, dict -> Dict.update(dict, word, 1, &(&1+1)) end)
  end
end
