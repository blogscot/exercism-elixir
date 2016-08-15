Code.load_file("agent_examples.exs")

ExUnit.start

defmodule AgentExamplesTest do
  use ExUnit.Case

  test "create a counter" do
    {status, _pid} = AgentExamples.create(0)
    assert status == :ok
  end

  test "increment the counter" do
    {:ok, agent} = AgentExamples.create(0)

    AgentExamples.update(agent, &increment/1)
    AgentExamples.update(agent, &increment/1)
    assert 2 == AgentExamples.get(agent)
  end

  test "get and update counter" do
    {:ok, agent} = AgentExamples.create(0)

    assert 0 == AgentExamples.get_and_update(agent, &old_and_new(&1))
    assert 1 == AgentExamples.get_and_update(agent, &old_and_new(&1))
    assert 2 == AgentExamples.get(agent)
  end

  defp increment(x), do: x+1
  defp old_and_new(x), do: {x, x+1}

  test "create a stored map" do
    {status, _pid} = AgentExamples.create(%{})
    assert status == :ok
  end

  test "store new stuff in the map" do
    {:ok, agent} = AgentExamples.create(%{})
    AgentExamples.update(agent, fn map -> Map.put(map, :name, "bob") end)
    assert %{name: "bob"} == AgentExamples.get(agent)
  end

  test "get and update map" do
    {:ok, agent} = AgentExamples.create(%{name: "bob"})
    assert %{name: "bob"} == AgentExamples.get_and_update(agent, fn map -> {map, %{map|name: "sue"}} end)
    assert %{name: "sue"} == AgentExamples.get(agent)
  end

end