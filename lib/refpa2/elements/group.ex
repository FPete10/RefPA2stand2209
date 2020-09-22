defmodule RefPA2.Elements.Group do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.{Group, Repo}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "groups" do
    field(:name, :string)
    field(:p_value, :float)

    has_many(:nodes, RefPA2.Elements.Node)
  end

  defp changeset(group, attrs) do
    group
    |> cast(attrs, [
      :name,
      :p_value
    ])
  end

  def get_groups() do
    Repo.all(Group)
  end

  def get_group_by_name(name) do
    Repo.get_by(Group, name: name)
  end

  def create_group(group_params) do
    %Group{}
    |> changeset_create(Group_params)
    |> Repo.insert()
  end
end
