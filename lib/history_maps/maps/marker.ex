defmodule HistoryMaps.Maps.Marker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "markers" do
    field :title, :string
    field :description, :string
    field :lat, :float
    field :lng, :float
    # has_many :products, CPAP.Product
    belongs_to :user, HistoryMaps.Accounts.User
    belongs_to :map, HistoryMaps.Maps.Map
    
    timestamps()
  end
  
  def changeset(marker, params \\ %{}) do
    marker
    |> cast(params, [:user_id, :map_id, :title, :description, :lat, :lng])
  end

  
end
