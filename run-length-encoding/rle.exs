defmodule RunLengthEncoder do

  def encodeKeywordList(my_list) do
    Enum.reduce(my_list, "", fn {k, v}, acc -> acc <> Integer.to_string(v) <> Atom.to_string(k) end)
  end

  def group_by_char([]), do: []

  @doc """
  Separate a list of single letters into common groups.
  e.g. ["A", "A", "A", "B", "C"] => [["A", "A", "A"], ["B"], ["C"]]
  """
  def group_by_char(chars = [char|_]) do
    seq = Enum.take_while(chars, &(&1==char))
    rest = Enum.drop(chars, Enum.count(seq))
    [seq] ++ group_by_char(rest)
  end

  @doc """
  Encode a list of single letter strings
  ["A", "A", "A"] => "3A"
  """
  def encode_list(list) do
    list
    |> Enum.map(&(String.to_charlist &1))
    |> Enum.map(&(List.to_atom &1))
    |> Enum.reduce(Keyword.new, fn letter, kws -> Keyword.update(kws, letter, 1, &(&1+1)) end)
    |> encodeKeywordList
  end

  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> group_by_char
    |> Enum.map(fn x -> encode_list x end)
    |> Enum.reduce("", fn x, acc -> acc <> x end)
  end

  def decode_sequence([]) do
    ""
  end

  @doc """
  Decode a list of encoded strings
  ["3", "A", "1", "B"] => "AAAB"
  """
  def decode_sequence(list) do
    [digit, letter] = Enum.take(list, 2)
    rest = Enum.drop(list, 2)
    String.duplicate(letter, String.to_integer digit) <> decode_sequence(rest)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/\d+|\D+/, string)
    |> List.flatten
    |> decode_sequence
  end

end
