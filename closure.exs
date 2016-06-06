defmodule Closure do
  def closed(first_name, last_initials) do
    Enum.map(last_initials, &(IO.puts "#{first_name} #{&1}"))
  end
end

Closure.closed("michael", ["m", "l", "j"])