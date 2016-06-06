fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, a) -> a
end

IO.puts fizz_buzz.(0,0,1)
IO.puts fizz_buzz.(1,0,1)
IO.puts fizz_buzz.(0,1,1)
IO.puts fizz_buzz.(1,1, "guma")

fizz_buzz_tuple_parmas = fn
  {0, 0, _} -> "FizzBuzz tupl"
  {0, _, _} -> "Fizz tupl"
  {_, 0, _} -> "Buzz tupl"
  {_, _, a} -> a
end

IO.puts fizz_buzz_tuple_parmas.({0,0,1})
IO.puts fizz_buzz_tuple_parmas.({1,0,1})
IO.puts fizz_buzz_tuple_parmas.({0,1,1})
IO.puts fizz_buzz_tuple_parmas.({1,1, :'guma tup'})


fb_remainder = fn(n) ->
  fizz_buzz.(rem(n, 3), rem(n,5), n)
end

IO.puts fb_remainder.(10)
IO.puts fb_remainder.(11)
IO.puts fb_remainder.(12)
IO.puts fb_remainder.(13)
IO.puts "-----------------------------"
list = [10,11,12,13,14,15]
Enum.each list, &IO.puts("#{&1} => #{fb_remainder.(&1)}")
