defmodule JsonApi.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    tree = [
      worker(JsonApi.Repo, [])
    ]
    supervise(tree, strategy: :one_for_one)
  end
end

