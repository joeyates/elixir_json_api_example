require Logger

defmodule JsonApi do
  def start(_type, _args) do
    Logger.info "Starting Cowboy"
    Plug.Adapters.Cowboy.http(JsonApi.Router, [], [port: 4000])
  end
end
