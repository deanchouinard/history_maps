defmodule HistoryMaps.Repo.Migrations.AddMarkersTable do
  use Ecto.Migration

  def change do

    create table(:markers) do
      add :user_id, references("users", on_delete: :delete_all)
      add :map_id, references("maps", on_delete: :delete_all)
      add :location_id, references("locations", on_delete: :delete_all)
      add :title, :string, size: 40, null: false
      add :description, :text

      timestamps()
    end
  end
end
