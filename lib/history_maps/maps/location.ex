
defmodule HistoryMaps.Maps.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :title, :string
    field :description, :string
    field :lat, :float
    field :lng, :float
    # has_many :products, CPAP.Product
    belongs_to :user, HistoryMaps.Accounts.User
    
    timestamps()
  end
  
  def changeset(location, params \\ %{}) do
    location
    |> cast(params, [:user_id, :title, :description, :lat, :lng])
  end

  
end
