defmodule RefPA2.Repo.Migrations.AddGateways do
  use Ecto.Migration

  def up do
    create table(:gateways, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :marked, :boolean

      timestamps()
    end
  end

  def down do
    drop.table(:nodes)
  end
end
