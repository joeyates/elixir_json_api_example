defmodule JsonApiHelloTest do
  use ExUnit.Case
  import Plug.Test

  test "it succeeds" do
    conn = conn("GET", "/hello")
    conn = JsonApi.Router.call(conn, [])
    assert conn.status == 200
  end

  test "it returns valid JSON" do
    conn = conn("GET", "/hello")
    conn = JsonApi.Router.call(conn, [])
    data = Poison.Parser.parse!(conn.resp_body)
    assert data["hello"] == "world"
  end
end
