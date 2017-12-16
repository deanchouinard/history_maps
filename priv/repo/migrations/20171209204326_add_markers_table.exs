defmodule HistoryMaps.Repo.Migrations.AddMarkersTable do
  use Ecto.Migration

  def change do

    create table(:markers) do
      add :user_id, references("users", on_delete: :delete_all)
      add :map_id, references("maps", on_delete: :delete_all)
      add :title, :string, size: 40, null: false
      add :description, :text
      add :lat, :float, null: false
      add :lng, :float, null: false

      timestamps()
    end
  end
end
