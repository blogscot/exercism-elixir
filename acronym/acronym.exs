defmodule Acronym do

  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    matcher = ~r/[A-Z]|(?<= )[a-z]/
    Regex.scan(matcher, string)
    |> List.flatten
    |> Enum.map(&(String.first &1))
    |> Enum.join
    |> String.upcase
  end
end
