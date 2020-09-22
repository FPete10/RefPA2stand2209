defmodule RefPA2.Repo.Migrations.AddGroups do
  use Ecto.Migration

  def up do
    create table(:groups, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :p_value, :float

      timestamps()
    end
  end

  def down do
    drop.table(:nodes)
  end
end
