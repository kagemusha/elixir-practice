defmodule Kuma do
  def say(something) do
    "kuma: #{something}"
  end
end

defmodule Guma do
  import Kuma

  def sayUnover(something) do
    Kuma.say something
  end

  def say(something) do
    "guma: #{something}"
  end
end

IO.puts Guma.say("burz")
IO.puts Guma.sayUnover("burz")
