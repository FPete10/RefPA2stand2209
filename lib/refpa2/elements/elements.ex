defmodule RefPA2.Elements do
  @moduledoc """
  Blockchain Module to controll and insert data into it.
  """

  import Ecto.Query, warn: false

  alias RefPA2.Elements.{Node, Gateway, Edge}

  require Logger

  def create_node(node_params) do
    {:ok, node} = node_params
    |> Map.put("type", :node)
    |> Node.create_node()

    node
  end

  def create_gateway(gateway_params) do
    {:ok, gateway} = gateway_params
    |> Map.put("type", :gateway)
    |> Node.create_gateway()

    gateway
  end

  def create_edge(edge_params, start_node, end_node) do
    {:ok, edge} = edge_params
    |> Map.put("start_node_id", start_node.id)
    |> Map.put("end_node_id", end_node.id)
    |> Edge.create_edge()

    edge
  end

end
