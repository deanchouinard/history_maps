defmodule HistoryMaps.Maps do
  alias HistoryMaps.Maps.Map
  alias HistoryMaps.Accounts.User
  alias HistoryMaps.Repo

  def list_maps do
    Repo.all(User)
  end

  def create_map(attrs \\ %{}) do
    %Map{}
    |> Map.changeset(attrs)
    |> Repo.insert()
  end
end

