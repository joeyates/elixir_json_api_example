defmodule JsonApi.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  def conf(_env) do
    parse_url("ecto://joe:foo@localhost/jsonapi_dev")
  end

  def priv,
    do: :code.priv_dir(:json_api)
end
