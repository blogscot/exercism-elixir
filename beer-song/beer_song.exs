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

  def verse(number) when number === 2 do
    """
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
"""
  end

  def verse(number) do
    """
#{number-1} bottles of beer on the wall, #{number-1} bottles of beer.
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

