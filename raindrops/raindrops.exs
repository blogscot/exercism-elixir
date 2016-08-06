defmodule Raindrops do
  @pairs [{3,"Pling"},{5,"Plang"},{7,"Plong"}]

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    for {factor, msg} <- @pairs do
      if rem(number, factor) === 0, do: msg, else: ""
    end
    |> Enum.join
    |> parse(number)
  end

  defp parse(value, number) when value === "", do: Integer.to_string(number)
  defp parse(value, _number), do: value
end
