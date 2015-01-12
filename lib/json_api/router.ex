defmodule JsonApi.Router do
  use Plug.Router
  import JsonApi.Rendering

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
    reply(conn, body)
  end

  match _ do
    raise NotFound
  end
end
