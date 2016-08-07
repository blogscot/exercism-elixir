defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(n) when n < 1, do: raise ArgumentError
  def nth(count) do
    nth(2, count, [])
  end

  def nth(_value, limit, primes) when length(primes) == limit, do: List.first(primes)
  def nth(value, limit, primes) do
    cond do
      is_prime?(value) -> nth(value+1, limit, [value|primes])
      true -> nth(value+1, limit, primes)
    end
  end

  def is_prime?(x) when x == 2 or x == 3, do: true
  def is_prime?(x) when rem(x, 2) == 0, do: false
  def is_prime?(n) do
    upper_limit = :math.sqrt(n) |> trunc
    is_prime?(n, 2, upper_limit)
  end

  defp is_prime?(_n, value, limit) when value > limit, do: true
  defp is_prime?(n, value, limit) do
    case rem(n, value) == 0 do
      true -> false
      false -> is_prime?(n, value+1, limit)
    end
  end

end