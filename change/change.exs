defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(_, []), do: :error
  def generate(amount, [smallest|_]) when amount < smallest, do: :error
  def generate(amount, values) do
    coins = values |> Enum.map(&({&1,0})) |> Enum.into(%{})
    collect_coins(amount, values |> Enum.sort |> Enum.reverse, coins)
  end

  defp collect_coins(0, _, coins), do: {:ok, coins}
  defp collect_coins(amount, [largest|rest]=values, coins) do
    new_amount = amount - largest
    case new_amount >= 0 do
      true -> collect_coins(new_amount, values, Map.update(coins, largest, 0, &(&1+1)))
      false -> collect_coins(amount, rest, coins)
    end
  end

end
