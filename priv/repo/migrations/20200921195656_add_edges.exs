defmodule RefPA2.Repo.Migrations.AddEdges do
  use Ecto.Migration

  def up do
    create table(:edges, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :modell, :string, null: false
      add :marked, :boolean

      add :start_node, :node
      add :end_node, :node

      timestamps()
    end
  end

  def down do
    drop.table(:nodes)
  end
end
