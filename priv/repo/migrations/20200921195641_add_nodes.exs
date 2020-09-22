defmodule RefPA2.Repo.Migrations.AddNodes do
  use Ecto.Migration

  def up do
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

      timestamps()
    end
  end

  def down do
    drop.table(:nodes)
  end
end
