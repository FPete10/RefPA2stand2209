defmodule RefPA2.Repo.Migrations.AddUser do
  use Ecto.Migration

  def up do
    UserRole.create_type()

    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string, null: false
      add :user_name, :string, null: false
      add :fore_name, :string
      add :last_name, :string
      add :password_hash, :string, null: false

      add :role, :user_role

      timestamps()
    end

    create unique_index(:users, :email)
  end

  def down do
    drop table(:users)

    UserRole.drop_type()
  end
end
