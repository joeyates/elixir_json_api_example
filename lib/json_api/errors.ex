defmodule JsonApi.Errors do
  defmodule NotFound do
    defexception [message: "Not Found"]

    defimpl Plug.Exception do
      def status(_exception) do
        404
      end
    end
  end
end
