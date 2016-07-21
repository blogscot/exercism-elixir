defmodule Bob do
  def hey(input) do

    input = input |> String.trim

    cond do
        isQuestion?(input) -> "Sure."
        isShouting?(input) -> "Whoa, chill out!"
        isSilent?(input) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end

  defp isShouting?(sentence) do
    sentence |> String.upcase === sentence and
    sentence |> String.downcase !== sentence
  end

  defp isQuestion?(sentence) do
    String.ends_with?(sentence, "?")
  end

  defp isSilent?(sentence) do
    sentence == ""
  end
end
