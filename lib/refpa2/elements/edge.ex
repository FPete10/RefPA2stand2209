defmodule RefPA2.Elements.Edge do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.{Edge, Repo}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "edges" do
    field(:name, :string, null: false)
    field(:modell, :string, null: false)
    field(:marked, :boolean)

    has_one(:start_node, RefPA2.Elements.Node)
    has_one(:end_node, RefPA2.Elements.Node)
  end

  defp changeset(edge, attrs) do
    edge
    |> cast(attrs, [
      :name,
      :modell,
      :marked
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
    |> changeset_create(edge_params)
    |> Repo.insert()
  end
end
