defmodule Practice do
  def add1(x) do
    x+1
  end
  def add2(x) do
    x+2
  end
end

y = Practice.add1(5)
    |> Practice.add2

IO.puts y