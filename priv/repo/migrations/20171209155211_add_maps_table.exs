defmodule HistoryMaps.Repo.Migrations.AddMapsTable do
  use Ecto.Migration

  def change do
    create table(:maps) do
      add :user_id, references("users", on_delete: :delete_all)
      add :title, :string, size: 40, null: false
      add :description, :text

      timestamps()
    end
  end
end
