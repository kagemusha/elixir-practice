defmodule Timeline do
  @behaviour Game

  def players do
    ["michael", "john"]
  end

  def status do
    "waiting to start"
  end
end