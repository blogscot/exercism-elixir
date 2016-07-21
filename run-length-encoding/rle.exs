defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t

  defp displayListOfTuple(my_list) do
    Enum.reduce(my_list, "", fn {k, v}, acc -> acc <> Integer.to_string(v) <> k end)
  end

  def encode(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reduce(Map.new, fn letter, dict -> Dict.update(dict, letter, 1, &(&1+1)) end)
    |> Map.to_list
    |> displayListOfTuple
  end

  @spec decode(String.t) :: String.t
  def decode(string) do

  end
end

IO.inspect RunLengthEncoder.encode("HORSE")