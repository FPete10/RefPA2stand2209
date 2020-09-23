defmodule RefPA2.Elements.Link do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.Repo
  alias RefPA2.Elements.{Node, Link}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "links" do
    many_to_many :nodes, RefPA2.Elements.Node, join_through: "node_links", on_replace: :delete
  end

  defp changeset(link, attrs) do
    link
    |> cast(attrs, [])
    |> put_assoc(:nodes, attrs["nodes"] || link.nodes)
  end

  def get_links() do
    Repo.all(Link)
  end

  def get_link(id) do
    Repo.get(Link, id)
  end

  def create_link(link_params) do
    # gets a list of only node ids and selects the corresponding nodes from database
    nodes = Enum.map(link_params["node_ids"] || [], &Node.get_node(&1))

    # deletes the node_id list and adds "full" node list to the params
    link_params =
      link_params
      |> Map.drop(["node_ids"])
      |> Map.put("nodes", nodes)

    %Link{}
    |> Repo.preload([:nodes])
    |> changeset(link_params)
    |> Repo.insert()
  end

  def update_link(link, link_params) do
    link
    |> Repo.preload([:nodes])
    |> changeset(link_params)
    |> Repo.update()
  end
end
