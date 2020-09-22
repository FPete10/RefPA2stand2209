defmodule RefPA2.Elements.Edge do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.Repo
  alias RefPA2.Elements.{Edge}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "edges" do
    field(:name, :string, null: false)
    field(:modell, :string, null: false)
    field(:marked, :boolean)

    belongs_to(:start_node, RefPA2.Elements.Node)
    belongs_to(:end_node, RefPA2.Elements.Node)

    timestamps()
  end

  defp changeset(edge, attrs) do
    edge
    |> cast(attrs, [
      :name,
      :modell,
      :marked,
      :start_node_id,
      :end_node_id,
    ])
  end

  def get_edges() do
    Repo.all(Edge)
  end

  def get_edge_by_name(name) do
    Repo.get_by(Edge, name: name)
  end

  def create_edge(edge_params) do
    %Edge{}
    |> changeset(edge_params)
    |> Repo.insert()
  end
end
