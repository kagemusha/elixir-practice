defmodule EvenFib do
  def sum(limit) do
    next(1, 1, 0, limit)
  end

  def next(a, b, sum, limit) when a + b > limit do
    sum
  end

  def next(a,b, sum, limit) do
    IO.puts "#{a}, #{b}, #{sum}, #{limit}"
    nextNum = a + b
    if rem(nextNum, 2) == 0 do
      sum = sum + nextNum
    end
    next(b, nextNum, sum, limit)
  end
end

IO.puts "Sum: #{EvenFib.sum(4000000)}"