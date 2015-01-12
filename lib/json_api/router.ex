defmodule JsonApi.Router do
  use Plug.Router
  alias JsonApi.Errors
  import JsonApi.Rendering

  plug :match
  plug :dispatch

  get "hello" do
    body = %{"hello" => "world"}
    reply(conn, body)
  end

  match _ do
    raise Errors.NotFound
  end
end
