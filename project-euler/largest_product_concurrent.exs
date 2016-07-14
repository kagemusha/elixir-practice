defmodule MaxCalc do

  def calc(pid, sequence, multiples_length) do
    IO.puts "seq: #{sequence}"
    nums = Enum.map String.codepoints(sequence), &(String.to_integer &1)
    first_product = Enum.slice(nums, 0, multiples_length)
          |> Enum.reduce(&(&1*&2))
    max = _calc_max(nums, multiples_length, first_product, 1, first_product)
#    IO.puts "Sending max: #{max}"
    send pid, {:max, max}
  end

  defp _calc_max(sequence, multiples_length, _, start, max)
                        when length(sequence) - start < multiples_length do
    max
  end

  defp _calc_max(sequence, multiples_length, old_product, start, max) do
    old_num = Enum.at sequence, start - 1
    new_num = Enum.at sequence, start - 1 + multiples_length
    new_product = trunc(old_product * new_num / old_num)
    #IO.puts("np = op * nn / on op, nn, np: #{new_product} = #{old_product} * #{new_num} / #{old_num}")
    _calc_max sequence, multiples_length, new_product, start + 1, max(max, new_product)
  end

end

defmodule LargestProduct do
  def get_max do
    receive do
      {:max, max} ->
        IO.puts "received max: "
        IO.inspect(max)
      _ ->
        IO.puts "error"
    end
  end

  def calc(sequence_string, multiples_length) do
    maxes = String.replace(sequence_string, "\n", "")
            |> String.split("0")
            |> Enum.map(fn(seq) -> spawn MaxCalc, :calc, [self, seq, multiples_length] end)
            |> Enum.map(fn(_) -> get_max() end)


    IO.puts "Maxes: #{inspect maxes}"
    Enum.max(maxes)
  end

end

ExUnit.start()

defmodule LargestProductTest do
  use ExUnit.Case, async: true

  @sequence  """
  73167176531331624999912539674426574742355349194934
  96983521312774516326239578318116984811869478851843
  85861561789112949495459511737958331952853218815511
  12541698747158523803151715693291963295227443143557
  66896648951445244523161731856413198711121722383113
  62229893423381318135336276614282816444486645238749
  31358917296291491561441772391713811515859317961866
  71172427121883998707918792274921911699721888193776
  65727333111153367881221235421819751254541594752243
  52584917711671556113614839586446716324415722155397
  53697817977846174164955149291862569321978468622482
  83972241375657156107491261417972968652414535111474
  82166371484413199891118895243451658541227588666881
  16427171479924442928231863465674813919123162824586
  17866458359124566529476545682848912883142617691142
  24219122671155626301111119371544217516941658961418
  17198413851962455444362981231987879927244284919188
  84581156166197919133875499211524063689912561717616
  15886116467119415177541112256983155211155935729725
  71636269561882671428252483611823257531421752963451
  """

  test "largest product" do
    assert LargestProduct.calc(@sequence, 4) == 6561
  end
end

