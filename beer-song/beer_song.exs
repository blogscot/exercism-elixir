defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) when number === 1 do
    """
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
"""
  end

  def verse(number) do
    """
#{pluralise(number-1)} of beer on the wall, #{pluralise(number-1)} of beer.
Take #{what?(number)} down and pass it around, #{pluralise(number-2)} of beer on the wall.
"""
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    (for number <- range, do: verse(number) <> "\n")
    |> Enum.join
    |> String.replace_suffix("\n", "")
  end

  defp pluralise(number, item \\ "bottle") do
    cond do
      number > 1 -> "#{number} #{item}s"
      number === 1 -> "#{number} #{item}"
      number === 0 -> "no more #{item}s"
      true -> :error
    end
  end

  defp what?(number) do
    cond do
      number === 2 -> "it"
      true -> "one"
    end
  end

end

