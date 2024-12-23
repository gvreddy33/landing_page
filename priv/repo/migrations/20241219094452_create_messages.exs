defmodule LandingPage.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :email, :string
      add :message, :string
      timestamps() # This adds "inserted_at" and "updated_at" columns
    end
  end
end
