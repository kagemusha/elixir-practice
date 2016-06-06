defmodule Include1 do
  def sayHi do
    IO.puts "hi"
  end
end

defmodule Include2 do
  def sayOhio do
    IO.puts "ohio"
  end

  def sayKuma do
    IO.puts "kuma"
  end
end

defmodule Spokesman do
  import Include1
  import Include2, only: [sayKuma: 0]

  def yowl do
    IO.puts "yowl"
    sayHi
  end
end


Spokesman.yowl
Spokesman.sayHi
Spokesman.sayKuma
Spokesman.sayOhio
