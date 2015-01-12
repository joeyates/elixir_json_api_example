defmodule JsonApiRouterTest do
  use ExUnit.Case
  import Plug.Test

  test "/hello succeeds" do
    conn = conn("GET", "/hello")
    conn = JsonApi.Router.call(conn, [])
    assert conn.status == 200
  end

  test "/hello returns valid JSON" do
    conn = conn("GET", "/hello")
    conn = JsonApi.Router.call(conn, [])
    data = Poison.Parser.parse!(conn.resp_body)
    assert data["hello"] == "world"
  end

  test "unknown paths" do
    assert_raise(JsonApi.Errors.NotFound, fn ->
      conn = conn("GET", "/unknwon")
      conn = JsonApi.Router.call(conn, [])
    end)
  end
end
