defmodule RefPA2.Elements.Node do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.{Node, Repo}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "nodes" do
    field(:name, :string, null: false)
    field(:modell, :string, null: false)
    field(:caption, :string)
    field(:external_participants, :string)
    field(:duration, :float)
    field(:probability, :integer)
    field(:data_object, :string)
    field(:it_system, :string)
    field(:p_value, :float)
    field(:marked, :boolean)

    has_many(:ingoing_edges, RefPA2.Elements.Edge)
    has_many(:outgoing_edges, RefPA2.Elements.Edge)
    has_many(:linked_nodes, RefPA2.Elements.Node)
    has_many(:groups, RefPA2.Elements.Group)
  end

  defp changeset(node, attrs) do
    node
    |> cast(attrs, [
      :name,
      :modell,
      :caption,
      :external_participants,
      :duration,
      :probability,
      :data_object,
      :it_system,
      :p_value,
      :marked
    ])
  end

  def get_nodes() do
    Repo.all(Node)
  end

  def get_node_by_name(name) do
    Repo.get_by(Node, name: name)
  end

  def create_node(node_params) do
    %Node{}
    |> changeset_create(node_params)
    |> Repo.insert()
  end
end
