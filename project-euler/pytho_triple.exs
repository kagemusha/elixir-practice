defmodule PythoTriple do

  def calc(sum) do
    c = trunc(sum/2)
    b = c - 1
    _calc(sum, c, b)
  end

  def _calc(sum, c, _) when c < sum/3 do
    IO.puts "calc #{sum}, #{c}, _"
    {:not_found}
  end

  def _calc(sum, c, b) when b < c/2 do
    IO.puts "calc #{sum}, #{c}, #{b} when b < c/2 "
    _calc(sum, c - 1, c - 2)
  end

  def _calc(sum, c, b) do
    IO.puts "calc #{sum}, #{c}, #{b} "
    a = sum - c - b
    if :math.pow(c, 2) == :math.pow(b, 2) + :math.pow(a, 2) do
      IO.inspect {:found, %{c: c, b: b, a: a}}
    else
      _calc(sum, c, b - 1)
    end
  end

end

x = PythoTriple.calc(1000)
inspect x

#ExUnit.start()
#
#defmodule PythoTripleTest do
#  use ExUnit.Case, async: true
#
#
#
#
#end