defmodule Printer do

  def print(a, b) do
    IO.puts "222"
    IO.puts a <> b
  end
  def my_module do
    __MODULE__
  end
  def print(a, b, c) do
    IO.puts a <> b <> c
  end

  def printName(name) do
    IO.puts "Name: " <> name
  end

  def say_type(val) when is_boolean(val) do
    IO.puts "Type of #{val}: boolean"
  end

  def say_type(val) when is_integer(val) do
    IO.puts "Type of #{val}: integer"
  end

  def say_type(val) do
    IO.puts "Type of #{val}: unknown"
  end
end
IO.puts "__MODULE__: #{Printer.my_module()}"
Printer.print("m", "m")
Printer.print("i","e","x")
#alias Printer.printName

Printer.printName("Madla")
#printName("Mad")
x = true
Printer.say_type(x)
Printer.say_type(5)