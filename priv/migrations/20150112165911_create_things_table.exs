defmodule JsonApi.Repo.Migrations.CreateThingsTable do
  use Ecto.Migration

  def up do
    [
      "CREATE TABLE things (
        id serial PRIMARY KEY,
        name text UNIQUE,
        created_at timestamp,
        updated_at timestamp)",

      "CREATE UNIQUE INDEX ON things (lower(name))"
    ]
  end

  def down do
    "DROP TABLE things"
  end
end
