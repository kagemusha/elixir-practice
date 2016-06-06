defmodule When do
  def printNum(n)
  when rem(n, 2) == 0 do
    IO.puts "#{n} is even"
  end
  def printNum(n) do
    IO.puts "#{n} is odd"
  end

  def is_even(n) do
    rem(n) == 0
  end

# will not compile: guard clause has limits - cannot have custom fns
#  def printN(n) when is_even(n) do
#    IO.puts "#{n} even"
#  end
end