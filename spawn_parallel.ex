defmodule SpawnParallel do
  def pmap(collection, func) do
    me = self
    collection
    |> Enum.map(fn (elem) ->
      spawn_link fn -> (send me, { self, func.(elem) }) end
      end)
    |> Enum.map(fn (pid) ->
      receive do { ^pid, result } ->
        IO.puts Enum.join(["me", inspect(me), "self", inspect(pid)])
        result
      end
    end)
  end
end


