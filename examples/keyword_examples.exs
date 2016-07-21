defmodule KeywordExamples do
  @doc """
  Converts a keyword to string
  """
  def displayKeyword([a, b]) do
    "#{a} => #{b}"
  end

  @doc """
  Creates a list of keywords
  """
  def buildListOfKeywords(my_list) do
    for {k, v} <- my_list, do: "#{v}#{k}"
  end

  @doc """
  Converts a list of keywords to a string
  """
  def listOfKeywordsToString(my_list) do
    Enum.reduce(my_list, "", fn {k, v}, acc -> acc <> Integer.to_string(v) <> Atom.to_string(k) end)
  end
end