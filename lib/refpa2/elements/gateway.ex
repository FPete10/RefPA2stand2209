defmodule RefPA2.Elements.Gateway do
  use Ecto.Schema

  import Ecto.Changeset
  import Ecto.Query, warn: false

  alias RefPA2.{Gateway, Repo}

  require Logger

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "gateways" do
    field(:name, :string)
    field(:modell, :string)
    field(:marked, :boolean)

    has_many(:ingoing_edges, RefPA2.Elements.Edge)
    has_many(:outgoing_edges, RefPA2.Elements.Edge)
  end

  defp changeset(gateway, attrs) do
    gateway
    |> cast(attrs, [
      :name,
      :modell,
      :marked
    ])
  end

  def get_gateways() do
    Repo.all(Gateway)
  end

  def get_gateway_by_name(name) do
    Repo.get_by(Gateway, name: name)
  end

  def create_gateway(gateway_params) do
    %Gateway{}
    |> changeset_create(gateway_params)
    |> Repo.insert()
  end
end
