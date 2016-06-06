defmodule Sieve do

  def primesBelow(num) do
    nums = Enum.reduce 2..num, %{}, fn(x, acc) -> Map.put(acc, x, true) end
    numRoot = trunc(:math.sqrt(num))
    primesMap = Enum.reduce(2..numRoot, nums, fn(i, acc) ->
      Enum.reduce(i..trunc(num/i), acc, fn(j, accJ) ->
        Map.drop(accJ, [i * j])  #remember 2nd param must be a list
      end)
    end)
    Map.keys primesMap
  end
end

ExUnit.start

defmodule SieveTest do
  use ExUnit.Case, async: true

  test "Sieve" do
    assert Sieve.primesBelow(20) == [2,3,5,7,11,13,17,19]
  end
end


