defmodule HistoryMaps.Maps do
  alias HistoryMaps.Maps.Map
  alias HistoryMaps.Accounts.User
  alias HistoryMaps.Repo

  def list_maps(user) do
    Repo.all(user_maps(user))
  end

  def get_map(id) do
    Repo.get(Map, id)
  end

  def create_map(attrs \\ %{}) do
    %Map{}
    |> Map.changeset(attrs)
    |> Repo.insert()
  end

  defp user_maps(user) do
    Ecto.assoc(user, :maps)
  end
end

