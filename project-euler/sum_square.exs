defmodule SumSquare do

  def calcSumSquares(num) do
    {_, sum} = Enum.map_reduce 1..num, 0, fn(x, acc) -> {0, x * x + acc} end
    sum
  end

  def calcSquareSum(num) do
    sum = Enum.reduce(1..num, &(&1 + &2))
    round :math.pow(sum, 2)
  end

end

ExUnit.start

defmodule SumSquareTest do
  use ExUnit.Case, async: true

  test "sum squares" do
    assert SumSquare.calcSumSquares(10) == 385
    assert SumSquare.calcSquareSum(10) == 3025
  end
end