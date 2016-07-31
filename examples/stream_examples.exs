defmodule Repl do
  require Integer

  def is_even do
    is_even = &Integer.is_even/1
    1..1000000
    |> Stream.filter(is_even)
    |> Stream.drop(100)
    |> Enum.take(2)
  end

  def get_lines(file, n) do
    file
    |> File.stream!
    |> Stream.map(&String.trim/1)
    |> Stream.with_index
    |> Stream.map(fn {line, i} -> "#{i}: #{line}" end)
    |> Enum.take(n)
  end

  @doc """
  Reads user input. Returns first line
  """
  def get_stdio() do
    IO.stream(:stdio, :line)
    |> Stream.map(&String.trim/1)
    |> Stream.with_index
    |> Stream.map(fn {line, i} -> "#{i}: #{line}" end)
    |> Enum.take(1)
  end

  def repeat(value, n) do
    Stream.repeatedly(fn -> value end)
    |> Enum.take(n)
  end

  def repeat(value, fun, n) do
    Stream.iterate(value, fun)
    |> Enum.take(n)
  end

  def fibs do
    Stream.unfold({1,1}, fn {a,b} ->
      {a, {b, a+b}}
    end)
  end

end


# r = Repl.get_lines("./test.exs", 100)
# r = Repl.get_stdio
# r = Repl.repeat(?f, 4)
# r = Repl.repeat(2, &(&1+2), 10)
r = Repl.fibs |> Enum.take(10)
IO.inspect(r)
