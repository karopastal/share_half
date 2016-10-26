defmodule ShareHalf.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :image, :string
      add :location, :string
      add :nickname, :string
      add :phone, :string
      add :facebook_id, :string

      timestamps()
    end

  end
end
