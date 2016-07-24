defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """

  def encodeKeywordList(my_list) do
    Enum.reduce(my_list, "", fn {k, v}, acc -> acc <> Integer.to_string(v) <> Atom.to_string(k) end)
  end

  def chunk([]), do: []

  def chunk(chars = [char|_]) do
    seq = Enum.take_while(chars, &(&1==char))
    rest = Enum.drop(chars, Enum.count(seq))
    [seq] ++ chunk(rest)
  end

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
    |> chunk
    |> Enum.map(fn x -> encode_list x end)
    |> Enum.reduce("", fn x, acc -> acc <> x end)
  end

  # @spec decode(String.t) :: String.t
  # def decode(string) do
  #
  # end
end


# r = RunLengthEncoder.encode("HORSE")
# r = RunLengthEncoder.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
# IO.puts(inspect r)