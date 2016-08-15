Code.load_file("task_examples.exs")

ExUnit.start

defmodule TaskExamplesTest do
  use ExUnit.Case

  test "increments a list of integers" do
    assert [2,3,4,5,6] == TaskExamples.example1([1,2,3,4,5])
  end

  test "squares the values in a keyword list" do
    assert [a: 1, b: 4, c: 9, d: 16] == TaskExamples.example2([a: 1, b: 2, c: 3, d: 4])
  end

end