defmodule JsonApi.Models.Thing do
  use Ecto.Model
  alias JsonApi.Repo
  import Ecto.Query, only: [from: 2]

  schema "things" do
    field :name, :string
  end

  def create(name) do
    thing = %JsonApi.Models.Thing{name: name}
    case validate_create(thing) do
      nil ->
        {:ok, thing} = Repo.transaction(fn ->
          Repo.insert(thing)
        end)
      errors ->
        {:error, Enum.into(errors, %{})}
    end
  end

  validatep validate_create(thing),
    name: present(),
    also: unique_name()

  defp unique_name(item) do
    query = from t in item.__struct__,
      where: t.name == ^item.name,
      select: t.id
    case Repo.all(query) do
      [values] ->
        %{name: "already taken"}
      _ ->
        %{}
    end
  end
end
