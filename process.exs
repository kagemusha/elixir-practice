defmodule Receiver do
  activated = false

  def receiveMsgs do
    IO.puts "act: #{activated}"
    receive if activated do
      {sender, msg} ->
        IO.puts msg
        receiveMsgs
    end
  end
end

pid = spawn Receiver, :receiveMsgs, []
send pid, {self, "hello"}
send pid, {self, "guma"}
