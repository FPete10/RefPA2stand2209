defmodule RefPA2.Repo.Migrations.AddEdges do
  use Ecto.Migration

  def change do
    create table(:edges, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :modell, :string, null: false
      add :marked, :boolean

      add :start_node_id, references(:nodes, on_delete: :delete_all, type: :uuid)
      add :end_node_id, references(:nodes, on_delete: :delete_all, type: :uuid)

      timestamps()
    end
  end
end
