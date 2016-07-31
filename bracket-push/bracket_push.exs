defmodule BracketPush do
  @open String.codepoints "([{"
  @close String.codepoints ")]}"

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str), do: is_balanced?(String.codepoints(str),[])

  defp is_balanced?([], []), do: true
  defp is_balanced?([], x), do: false
  defp is_balanced?(input=[h|t], stack) do
      if is_empty?(input),   do: is_empty?(stack),
      else: if is_open?(h),  do: is_balanced?(t, stack ++ [h]),
      else: if is_close?(h), do: !is_empty?(stack) &&
                                 is_matching?(List.last(stack), h) &&
                                 is_balanced?(t, Enum.drop(stack,-1)),
      else: is_balanced?(t, stack)
  end

  defp is_empty?(list), do: length(list) == 0
  defp is_open?(ch), do: ch in @open
  defp is_close?(ch), do: ch in @close
  defp is_matching?(open, close) do
    o = Enum.find_index(@open, &(&1 === open))
    c = Enum.find_index(@close, &(&1 === close))
    !is_nil(o) && o == c
  end

end
