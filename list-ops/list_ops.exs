defmodule ListOps do


  @spec count(list) :: non_neg_integer
  def count(l) do
    reduce(l, 0, fn _, acc -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  def reverse([], result), do: result
  def reverse([h|t], result) do
    reverse(t, [h|result])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    case l do
      [] -> []
      [h|t] -> append([f.(h)], map(t, f))
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn x, acc ->
      if f.(x) do append([x], acc) else acc end
    end) |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
      [] -> acc
      [h|t] -> reduce(t, f.(h, acc), f)
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    case a do
      [] -> b
      [h|t] -> [h|append(t, b)]
    end
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    case ll do
      [] -> []
      [hl|tl] -> append(hl, concat(tl))
    end
  end
end
