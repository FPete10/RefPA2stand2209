defmodule RefPA2.Elements.Node do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.Repo
  alias RefPA2.Elements.{Node}

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

    field(:type, NodeType, default: :node, null: false)

    has_many(:ingoing_edges, RefPA2.Elements.Edge, foreign_key: :start_id)
    has_many(:outgoing_edges, RefPA2.Elements.Edge, foreign_key: :end_id)

    many_to_many :groups, RefPA2.Elements.Group, join_through: "node_groups", on_replace: :delete

    many_to_many :links, RefPA2.Elements.Node, join_through: "linked_nodes", on_replace: :delete

    timestamps()
  end

  defp node_changeset(node, attrs) do
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
      :type,
      :marked
    ])
  end

  defp gateway_changeset(node, attrs) do
    node
    |> cast(attrs, [
      :name,
      :modell,
      :type,
      :marked
    ])
  end

  def get_nodes() do
    Repo.all(Node)
  end

  def get_node(id) do
    Repo.get(Node, id)
  end

  def get_node_by_name(name) do
    Repo.get_by(Node, name: name)
  end

  def create_node(node_params) do
    linked_nodes = Enum.map(node_params["node_ids"] || [], &Node.get_node(&1))

    node_params =
      node_params
      |> Map.drop(["node_ids"])
      |> Map.put("linked_nodes", linked_nodes)

    %Node{}
    |> node_changeset(node_params)
    |> Repo.insert()
  end

  def create_gateway(gateway_params) do
    %Node{}
    |> gateway_changeset(gateway_params)
    |> Repo.insert()
  end
end
