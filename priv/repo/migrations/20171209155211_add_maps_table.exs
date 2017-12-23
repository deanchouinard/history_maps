defmodule HistoryMaps.Repo.Migrations.AddMapsTable do
  use Ecto.Migration

  def change do
    create table(:maps) do
      add :user_id, references("users", on_delete: :delete_all)
      add :title, :string, size: 40, null: false
      add :description, :text
      add :lat, :float, null: false
      add :lng, :float, null: false
      add :zoom, :integer, null: false

      timestamps()
    end
  end
end
