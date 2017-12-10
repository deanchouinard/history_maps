defmodule HistoryMaps.Maps.Map do
  use Ecto.Schema
  import Ecto.Changeset

  schema "maps" do
    field :title, :string
    field :description, :string
    # has_many :products, CPAP.Product
    belongs_to :user, HistoryMaps.Accounts.User
    
    timestamps()
  end
  
  def changeset(map, params \\ %{}) do
    map
    |> cast(params, [:user_id, :title])
  end

  
end