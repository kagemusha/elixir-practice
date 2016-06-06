defmodule LargestPrime do
  @initial_primes [2,3,5,7,11,13,17,19,23,29,31]

  def bad_div(num) do
    Enum.each([2,3,5], fn(div) ->
      if rem(num, div) == 0 do
        num = num/div
        IO.puts "n: #{num}"
      end
    end)
  end

  def better_div(num) do
    Enum.reduce([2, 3, 5], [num, 1], fn(div, acc) ->
      [num0, div0] = acc
      if rem(num0, div) == 0, do: [round(num0/div), div] , else: acc
    end)
  end

end

ExUnit.start

defmodule Test do
   use ExUnit, async: true

   test "" do

   end
#IO.puts LargestPrime.bad_div(30)
num = 44
IO.puts "Num: #{num}"
IO.puts "[leftover, largestDivisor]: #{inspect(LargestPrime.better_div(num))}"
