defmodule TaskExamples do

  def example1(list) do
    list
    |> Enum.map(&Task.async(fn -> increment(&1) end))
    |> Enum.map(&Task.await(&1))
  end

  def example2(keyword_list) do
    keyword_list
    |> Enum.map(&Task.async(fn -> square(&1) end))
    |> Enum.map(&Task.await(&1))
  end

  defp increment(num), do: num + 1
  defp square({k, v}), do: {k, v*v}

end