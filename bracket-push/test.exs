defmodule Brackets do

  @open String.codepoints "([{"
  @close String.codepoints ")]}"

  def is_open?(ch), do: ch in @open
  def is_close?(ch), do: ch in @close
  def is_matching?(open, close) do
    IO.inspect("is_matching? -> #{inspect open} : #{inspect close}")
    o = Enum.find_index(String.codepoints("([{"), &(&1 === open))
    c = Enum.find_index(String.codepoints(")]}"), &(&1 === close))
    debug = !is_nil(o) && o == c
    IO.inspect("returns -> #{inspect o} == #{inspect c} -> #{debug}")
    debug
  end

  def is_empty?(list), do: length(list) == 0


  def is_balanced?([], []), do: true
  def is_balanced?([], x), do: false
  def is_balanced?(input=[h|t], stack) do
      IO.inspect("is_balanced? -> #{input} : #{stack}")
      if is_empty?(input),   do: is_empty?(stack),
      else: if is_open?(h),  do: is_balanced?(t, stack ++ [h]),
      else: if is_close?(h), do: !is_empty?(stack) &&
                                 is_matching?(List.last(stack), h) &&
                                 is_balanced?(t, Enum.drop(stack,-1)),
      else: is_balanced?(t, stack)
  end

end

input = String.codepoints("[[[")
r = Brackets.is_balanced?(input,[])
# r = Brackets.is_matching?("(", "}")
IO.inspect(r)


