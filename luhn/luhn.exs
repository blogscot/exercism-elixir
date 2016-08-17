defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
      number
      |> Integer.parse
      |> (fn {value, _} -> Integer.digits value end).()
      |> Enum.reverse
      |> Enum.with_index(1)
      |> Enum.map(fn {num, index} ->
          cond do
            rem(index, 2) != 0 -> num
            true ->
              cond do
                num * 2 >= 10 -> num * 2 - 9
                true -> num * 2
              end
          end
      end)
      |> Enum.sum
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number
    |> checksum
    |> rem(10) == 0
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    (number <> "0")
    |> checksum
    |> rem(10)
    |> (fn digit ->
      number <> (10 - digit |> rem(10) |> to_string)
    end).()
  end
end
