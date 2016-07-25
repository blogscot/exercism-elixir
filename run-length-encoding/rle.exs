defmodule RunLengthEncoder do

  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> Enum.chunk_by(&(&1))
    |> Enum.reduce("", fn x, acc -> acc <> (x |> length |> to_string) <> hd x end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r{(\d+)(\D)}, string)
    |> Enum.reduce("",
      fn [_, digit, letter], acc ->
        acc <> String.duplicate(letter, String.to_integer digit)
      end)
  end
end
