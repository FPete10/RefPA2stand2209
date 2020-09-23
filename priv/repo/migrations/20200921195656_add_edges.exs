defmodule RefPA2.Repo.Migrations.AddEdges do
  use Ecto.Migration

  def change do
    create table(:edges, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :modell, :string, null: false
      add :marked, :boolean

      add :start_id, references(:nodes, type: :uuid)
      add :end_id, references(:nodes, type: :uuid)

      timestamps()
    end
  end
end
