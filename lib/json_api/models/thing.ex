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
    also: unique(:name)

  defp unique(item, field) do
    value = Map.fetch!(item, field)
    query = from record in item.__struct__,
      where: field(record, ^field) == ^value,
      select: record.id
    case Repo.all(query) do
      [values] ->
        %{name: "already taken"}
      _ ->
        %{}
    end
  end
end
