defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    """
#{pluralise(number-1, :capitalise)} of beer on the wall, #{pluralise(number-1)} of beer.
#{action?(number)}, #{pluralise(number-2)} of beer on the wall.
"""
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range \\ 100..1) do
    Enum.map(range, &(verse &1))
    |> Enum.join("\n")
  end

  defp pluralise(number), do: pluralise(number, :nothing)
  
  defp pluralise(1, _), do: "1 bottle"
  defp pluralise(0, :capitalise), do: "No more bottles"
  defp pluralise(0, _), do: "no more bottles"
  defp pluralise(-1, _), do: "99 bottles"
  defp pluralise(number, _), do: "#{number} bottles"

  defp action?(2), do: "Take it down and pass it around"
  defp action?(1), do: "Go to the store and buy some more"
  defp action?(_), do: "Take one down and pass it around"

end
