defmodule HistoryMaps.Maps do
  alias HistoryMaps.Maps.Map
  alias HistoryMaps.Accounts.User
  alias HistoryMaps.Repo

  def list_maps(user) do
    Repo.all(user_maps(user))
  end

  def get_map(id, user) do
    Repo.get(user_maps(user), id)
    #Repo.get(Map, id)
  end

  def new_map(user) do
    user
    |> Ecto.build_assoc(:maps)
    |> Map.changeset()
  end


  def create_map(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:maps)
    |> Map.changeset(attrs)
    |> Repo.insert()
  end

  defp user_maps(user) do
    Ecto.assoc(user, :maps)
  end
end

