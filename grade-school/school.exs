defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade) do
    cond do
      is_nil(db[grade]) -> Map.put(db, grade, [name])
      true -> Map.put(db, grade, [name|db[grade]])
    end
  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade) do
    case Map.get(db, grade) do
      nil -> []
      students -> students
    end
  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    db
    |> Map.to_list
    |> Enum.map(fn {key, value} -> {key, Enum.sort(value)} end)
  end
end
