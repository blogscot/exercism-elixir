defmodule AgentExamples do
  def create(state) do
    Agent.start_link fn -> state end
  end

  def get(agent) do
    Agent.get(agent, fn state -> state end)
  end

  def update(agent, fun) do
    Agent.update(agent, fun)
  end

  def get_and_update(agent, fun) do
    Agent.get_and_update(agent, fun)
  end
end