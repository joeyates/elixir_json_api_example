defmodule JsonApi.Router do
  use Plug.Router

  defmodule NotFound do
    defexception [message: "Not Found"]

    defimpl Plug.Exception do
      def status(_exception) do
        404
      end
    end
  end

  plug :match
  plug :dispatch

  get "hello" do
    body = %{"hello" => "world"}
    body = Poison.encode!(body, pretty: true)
    put_resp_header(conn, "content-type", "application/json")
    send_resp(conn, 200, body)
  end

  match _ do
    raise NotFound
  end
end
