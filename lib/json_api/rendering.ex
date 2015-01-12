defmodule JsonApi.Rendering do
  import Plug.Conn

  def reply(conn, content) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(200, render(content))
  end

  def render(map) when is_map(map) do
    Poison.encode!(map, pretty: true)
  end
end
