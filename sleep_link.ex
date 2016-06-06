defmodule SleepLink do
  import :timer, only: [ sleep: 1 ]

  def msg_parent(parent) do
    send parent, "oh herou"
  end

  spawn_link(SleepLink, :msg_parent, [self])
  sleep 500
  IO.puts "Waking up"
  receive do
    msg ->
      "Msg: #{msg} end"
  end

end
