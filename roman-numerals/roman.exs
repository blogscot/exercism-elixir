defmodule Roman do

  @numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number), do: numerals(number, @numerals)

  defp numerals(number, _) when number < 1, do: ""

  defp numerals(number, numerals=[{arabic, roman}|tail]) when number >= arabic  do
    roman <> numerals(number - arabic, numerals)
  end

  defp numerals(number, [_ | tail]) do
    numerals(number, tail)
  end
end
