defmodule JsonApi.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "hello" do
    body = %{"hello" => "world"}
    body = Poison.encode!(body, pretty: true)
    put_resp_header(conn, "content-type", "application/json")
    send_resp(conn, 200, body)
  end
end
