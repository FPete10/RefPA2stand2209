defmodule RefPA2.Repo.Migrations.AddGroups do
  use Ecto.Migration

  def change do
    create table(:groups, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :p_value, :float

      timestamps()
    end

    create table("node_groups", primary_key: false) do
      add :group_id, references(:groups, type: :uuid), primary_key: true

      add :node_id, references(:nodes, type: :uuid), primary_key: true
    end
  end
end
