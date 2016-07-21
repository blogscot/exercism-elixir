defmodule TupleExamples do
  @moduledoc """
  A collection use cases for Elixir tuples
  """

  @doc """
  Converts a tuple to string

  ## Examples

    iex> TupleExamples.displayTuple({:a, 1})
    a => 1

  """
  def displayTuple({a, b}) do
    "#{a} => #{b}"
  end

  @doc """
  Displays a list of tuples
  """
  def displayListOfTuple(my_list) do
    for {k, v} <- my_list do
      "#{v}#{k}"
    end
  end

  @doc """
  Converts a list of tuples to a string
  """
  def listOfTupleToString(my_list) do
    Enum.reduce(my_list, "", fn {k, v}, acc -> acc <> Integer.to_string(v) <> k end)
  end
end
