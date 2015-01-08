defmodule HelloHandler do
  def init(_type, req, []) do
    {:ok, req, :no_state}
  end

  def handle(request, state) do
    {:ok, reply} = :cowboy_req.reply(
      200,
      [{"content-type", "application/json"}],
      body(),
      request
    )
    {:ok, reply, state}
  end

  defp body do
    Poison.Encoder.encode(%{"hello" => "world"}, [])
  end
end
