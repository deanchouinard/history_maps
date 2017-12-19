defmodule HistoryMaps.Maps.Map do
  use Ecto.Schema
  import Ecto.Changeset

  schema "maps" do
    field :title, :string
    field :description, :string
    # has_many :products, CPAP.Product
    belongs_to :user, HistoryMaps.Accounts.User
    has_many :markers, HistoryMaps.Maps.Marker
    
    timestamps()
  end
  
  def changeset(map, params \\ %{}) do
    map
    |> cast(params, [:user_id, :title, :description])
  end

  
end
