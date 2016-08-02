defmodule Phone do
  @invalid_number "0000000000"

  @spec number(String.t) :: String.t
  def number(raw) do
    cleaned = Regex.scan(~r/[a-z\d]+/, raw)
      |> List.flatten
      |> Enum.reduce("", &(&2 <> &1))

    case String.length(cleaned) do
      10 -> cleaned
      11 -> cond do
        String.at(cleaned,0) === "1" -> String.slice(cleaned, 1..-1)
        true -> @invalid_number
      end
      _ -> @invalid_number
    end
  end

  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw
    |> number
    |> String.slice(0,3)
  end

  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    num = number(raw)
    "(" <> String.slice(num,0,3) <> ") " <> String.slice(num,3,3) <> "-" <> String.slice(num,6,4)
  end

end
