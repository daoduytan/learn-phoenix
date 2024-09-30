defmodule Demo1.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:task) do
      add :title, :string
      add :status, :string

      timestamps(type: :utc_datetime)
    end
  end
end
