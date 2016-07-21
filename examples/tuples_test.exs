Code.load_file("tuple_examples.exs")

ExUnit.start

defmodule TupleExamplesTest do
  use ExUnit.Case
  # doctest TupleExamples

  test "converts a tuple to string" do
    assert TupleExamples.displayTuple({:a, 1}) == "a => 1"
  end

  test "displays a list of tuples to string" do
    tuple_list = [{"A", 1},{"P", 2},{"L", 1},{"E", 1}]
    assert TupleExamples.displayListOfTuple(tuple_list) == ["1A", "2P", "1L", "1E"]
  end

  test "converts a list of tuples to string" do
    tuple_list = [{"A", 1},{"P", 2},{"L", 1},{"E", 1}]
    assert TupleExamples.listOfTupleToString(tuple_list) == "1A2P1L1E"
  end

end
