
# Transforms a Map into a list
%{a: 1, b: 2} |> Enum.map(fn {k, v} -> {k, v*3} end)

# Transforms a Map into another Map
%{a: 1, b: 2} |> Enum.into(%{}, fn {k, v} -> {k, v*3} end)