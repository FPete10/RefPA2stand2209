defmodule RefPA2.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :uuid, primary_key: true

      add :short, :string, null: false
      add :url, :string, null: false

      add :private, :boolean, null: false
      add :archived, :boolean, null: false
      add :valid_infinite, :boolean, null: false
      add :valid_until, :utc_datetime, null: true

      add :user_id, references(:users, on_delete: :delete_all, type: :uuid)

      timestamps()
    end
  end
end
