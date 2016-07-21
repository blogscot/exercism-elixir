Code.load_file("keyword_examples.exs")

ExUnit.start

defmodule KeywordExamplesTest do
  use ExUnit.Case

  test "converts a keyword to string" do
    assert KeywordExamples.displayKeyword([:a, 1]) == "a => 1"
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
