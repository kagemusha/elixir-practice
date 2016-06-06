defmodule Fizzbuzz do

  def sum(limit) do
    add(limit, 0)
  end

  def add(3, sum) do
    IO.puts "End sum: #{sum+3}"
    sum + 3
  end

  def add(num, sum) do
    if rem(num,3) == 0 or rem(num,5) == 0 do
      sum = sum + num
      IO.puts "Num: #{num} sum: #{sum}"
    end
    add(num - 1, sum)
  end

end

IO.puts Fizzbuzz.sum(100)