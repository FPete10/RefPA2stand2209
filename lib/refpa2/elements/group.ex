defmodule RefPA2.Elements.Group do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.Repo
  alias RefPA2.Elements.{Group, Node}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "groups" do
    field(:name, :string)
    field(:p_value, :float)

    many_to_many :nodes, RefPA2.Elements.Node, join_through: "node_groups", on_replace: :delete

    timestamps()
  end

  defp changeset(group, attrs) do
    group
    |> cast(attrs, [
      :name,
      :p_value
    ])
    |> put_assoc(:nodes, attrs["nodes"] || group.nodes)
  end

  def get_groups() do
    Repo.all(Group)
  end

  def get_group_by_name(name) do
    Repo.get_by(Group, name: name)
  end

  def create_group(group_params) do
    nodes = Enum.map(group_params["node_ids"] || [], &Node.get_node(&1))

    group_params =
      group_params
      |> Map.drop(["node_ids"])
      |> Map.put("nodes", nodes)

    %Group{}
    |> Repo.preload([:nodes])
    |> changeset(group_params)
    |> Repo.insert()
  end
end
