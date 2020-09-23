defmodule RefPA2.Elements do
  @moduledoc """
  Blockchain Module to controll and insert data into it.
  """

  import Ecto.Query, warn: false

  alias RefPA2.Elements.{Node, Group, Edge, Link}

  require Logger

  def create_node(node_params, nodes \\ []) do
    node_ids = Enum.map(nodes || [], & &1.id)

    {:ok, node} =
      node_params
      |> Map.put("type", :node)
      |> Map.put("node_ids", node_ids)
      |> Node.create_node()

    node
  end

  def create_gateway(gateway_params) do
    {:ok, gateway} =
      gateway_params
      |> Map.put("type", :gateway)
      |> Node.create_gateway()

    gateway
  end

  def create_edge(edge_params, start_node, end_node) do
    {:ok, edge} =
      edge_params
      |> Map.put("start_id", start_node.id)
      |> Map.put("end_id", end_node.id)
      |> Edge.create_edge()

    edge
  end

  def create_group(group_params, nodes) do
    node_ids = Enum.map(nodes || [], & &1.id)

    {:ok, group} =
      group_params
      |> Map.put("node_ids", node_ids)
      |> Group.create_group()

    group
  end

  def create_link(nodes) do
    node_ids = Enum.map(nodes || [], & &1.id)

    {:ok, group} =
      %{}
      |> Map.put("node_ids", node_ids)
      |> Link.create_link()

    group
  end

  def add_node_to_link(link, node_ids) do
    # adds the given nodes to the list of nodes for the given link
    link_nodes =
      Enum.reduce(
        node_ids || [],
        link.nodes,
        &[Node.get_node(&1) | &2]
      )

    {:ok, link} = Link.update_link(link, %{"nodes" => link_nodes})
    link
  end

  def delete_node_from_link(link, node_ids) do
    # deletes the given nodes from the list of nodes for the given link
    link_nodes =
      Enum.reduce(
        node_ids || [],
        link.nodes,
        fn node_id, acc ->
          List.delete(
            acc,
            Enum.find(acc, nil, &(&1.id == node_id))
          )
        end
      )

    {:ok, link} = Link.update_link(link, %{"nodes" => link_nodes})
    link
  end
end
