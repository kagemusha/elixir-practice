defmodule Math do
  def sum_list([], accumulator) do
    accumulator
  end

  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

end

IO.puts Math.sum_list([1, 2, 3], 0) #=> 6