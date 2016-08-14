defmodule Frequency do

  @ode_an_die_freude """
  Freude schöner Götterfunken
  Tochter aus Elysium,
  Wir betreten feuertrunken,
  Himmlische, dein Heiligtum!
  Deine Zauber binden wieder
  Was die Mode streng geteilt;
  Alle Menschen werden Brüder,
  Wo dein sanfter Flügel weilt.
  """

  def frequency(texts \\ [@ode_an_die_freude]) do

    texts
    |> Enum.join
    |> String.downcase
    |> remove_punctuation
    |> String.graphemes
    |> Enum.reduce(Map.new, fn letter, dict ->
      Map.update(dict, letter, 1, &(&1+1)) end)
  end

  defp remove_punctuation(string) do
    Regex.replace(~r/\p{P}+/, string, "")
  end

end
