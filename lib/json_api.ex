defmodule JsonApi do
  def start() do
    dispatch = :cowboy_router.compile([
      {
        :_,
        [
          {"/hello.json", HelloHandler, []}
        ]
      }
    ])
    {:ok, _} = :cowboy.start_http(
      :http,
      100,
      [{:port, 8080}],
      [{:env, [{:dispatch, dispatch}]}]
    )
  end
end
