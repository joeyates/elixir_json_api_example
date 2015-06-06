defmodule JsonApiModelsThingTest do
  use ExUnit.Case
  alias JsonApi.Models.Thing
  alias JsonApi.Repo
  alias Ecto.Adapters.Postgres

  setup do
    :ok = Postgres.begin_test_transaction(Repo, [])
    on_exit fn ->
      :ok = Postgres.rollback_test_transaction(Repo, [])
    end
    :ok
  end

  test ".create saves the record" do
    {:ok, thing} = Thing.create("Thing 1")
    assert is_integer(thing.id)
  end

  test ".create validates the uniqueness of names" do
    {:ok, thing1} = Thing.create("Thing 1")
    {status, errors} = Thing.create(thing1.name)
    assert status == :error
  end
end
