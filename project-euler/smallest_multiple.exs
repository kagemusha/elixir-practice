defmodule SmallestMultiple do

  def calc(limit) do
    _calc(limit, 2, [])
  end


  defp _calc(limit, next_num, multiples) when next_num > limit do
    IO.puts "The mults up to #{limit}: #{inspect(multiples)}"
    Enum.reduce multiples, &(&1 * &2)
  end

  defp _calc(limit, next_num, multiples) do
    IO.puts "lim: #{limit}, nex: #{next_num}, mults: #{inspect(multiples)}"
    new_mult = get_new_mult(next_num, multiples)
    if new_mult > 1, do: multiples = multiples ++ [new_mult]
    _calc(limit, next_num + 1, multiples)
  end

  defp get_new_mult(1, _) do
    1
  end

  defp get_new_mult(num, []) do
    num
  end

  defp get_new_mult(next_num, multiples) do
    [next_mult | tail] = multiples
    if rem(next_num, next_mult) == 0, do: next_num = trunc(next_num/next_mult)
    get_new_mult(next_num, tail)
  end
  #############################################################################

  defp _calc0(limit, next_num, multiples) when next_num > limit do
    Enum.reduce multiples, &(&1 * &2)
  end

  defp _calc0(limit, next_num, multiples) do
    IO.puts "lim: #{limit}, nex: #{next_num}, mults: #{inspect(multiples)}"

    newMult = Enum.reduce(multiples, next_num, fn(mult, next_num) ->
      if rem(next_num, mult) == 0, do: trunc(next_num/mult), else: next_num
    end)
    if newMult > 1, do: multiples = multiples ++ [newMult]
    _calc(limit, next_num + 1, multiples)
  end

end

ExUnit.start

defmodule SmallestMultipleTest do
  use ExUnit.Case, async: true

  test "SmallestMultiples 10" do
    assert SmallestMultiple.calc(10) == 2520, "10 works"
  end

  test "SmallestMultiples 11" do
    assert SmallestMultiple.calc(11) == (2520 * 11), "11 works"
  end
end