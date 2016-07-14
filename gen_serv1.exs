defmodule Stack do
  use GenServer

  # Callbacks

  def handle_call(:pop, _from, state) do
    [h | t] = state
    {:reply, h, t}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end

# Start the server
{:ok, pid} = GenServer.start_link(Stack, [:hello])

# This is the client
GenServer.call(pid, :pop)
#=> :hello

GenServer.cast(pid, {:push, :world})
GenServer.cast(pid, {:push, :world1})
GenServer.cast(pid, {:push, :world2})
#=> :ok

IO.puts GenServer.call(pid, :pop)
#=> :world