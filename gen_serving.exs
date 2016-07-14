defmodule Scorekeeper do
  use GenServer

  def init(teams) do
    teamsMap = Enum.reduce(teams, %{}, &( Map.put(&2, &1, 0)))
    {:ok, teamsMap}
  end

  def handle_cast({:add_score, team, amount}, teams) do
    old_score = Map.get(teams, team);

    { :noreply, Map.put(teams, team, old_score + amount) }
  end

  def handle_call(:get_score, _from, teams) do
    {:reply, teams, teams}
  end

  def handle_call({:get_team_score, team}, _from, teams) do
    {:reply, Map.get(teams, team), teams}
  end
end

{:ok, pid} = GenServer.start_link(Scorekeeper, [:mets, :braves])
GenServer.cast(pid, {:add_score, :mets, 2})
GenServer.cast(pid, {:add_score, :mets, 2})
IO.inspect GenServer.call(pid, :get_score)
IO.inspect GenServer.call(pid, {:get_team_score, :mets})
