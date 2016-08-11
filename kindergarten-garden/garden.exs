defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @names [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet,
           :ileana, :joseph, :kincaid, :larry]

  @flowers %{"C": :clover, "G": :grass, "R": :radishes, "V": :violets}

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @names) do
    children = students(student_names)
    [row1, row2] = String.split(info_string, "\n")

    children
    |> Enum.map(fn {name, range} ->
       {name,
        String.slice(row1, range) <> String.slice(row2, range)
        |> String.codepoints
        |> Enum.map(fn plant -> @flowers[String.to_existing_atom(plant)] end)
        |> List.to_tuple
        }
    end)
    |> Enum.into(%{})
  end

  @spec students(String.t()) :: map
  def students(names \\ @names) do
    names
    |> Enum.sort
    |> Enum.with_index
    |> Enum.map(fn {name, index} -> {name, index*2..index*2+1} end)
    |> Enum.into(%{})
  end

end
