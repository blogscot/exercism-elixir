Code.load_file("keyword_examples.exs")

ExUnit.start

defmodule KeywordExamplesTest do
  use ExUnit.Case

  test "converts a keyword to string" do
    assert KeywordExamples.displayKeyword([A: 2]) == "[A: 2]"
  end

  test "raises FunctionClauseError when converting a keyword list (length > 1) to string" do
    assert_raise FunctionClauseError , fn ->
      KeywordExamples.displayKeyword([A: 2, B: 1])
    end
  end

  test "converts a list of keywords to a list of strings" do
    keyword_list = [A: 1, P: 2, L: 1, E: 1]
    assert KeywordExamples.buildListOfKeywords(keyword_list) == ["1A", "2P", "1L", "1E"]
  end

  test "converts a list of keywords to string" do
    keyword_list = [A: 1, P: 2, L: 1, E: 1]
    assert KeywordExamples.listOfKeywordsToString(keyword_list) == "1A2P1L1E"
  end

end
