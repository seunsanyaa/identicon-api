defmodule Identiconapi.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :url, :string

      timestamps()
    end
  end
end
