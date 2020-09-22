defmodule RefPA2.Repo.Migrations.AddNodes do
  use Ecto.Migration

  def up do
    NodeType.create_type()

    create table(:nodes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :modell, :string, null: false
      add :caption, :string
      add :external_participants, :string
      add :duration, :float
      add :probability, :integer
      add :data_object, :string
      add :it_system, :string
      add :p_value, :float
      add :marked, :boolean

      add :type, :node_type

      timestamps()
    end

    create table("node_node_connections", primary_key: false) do
      add :node_id1, references(:nodes, type: :uuid), primary_key: true

      add :node_id2, references(:nodes, type: :uuid), primary_key: true
    end
  end

  def down do
    drop table(:node_node_connections)
    drop table(:nodes)

    NodeType.drop_type()
  end
end
