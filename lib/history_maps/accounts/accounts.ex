defmodule HistoryMaps.Accounts do
  alias HistoryMaps.Accounts.User
  alias HistoryMaps.Repo

  def list_users do
    Repo.all(User)
  end

  def get_user(id) do
    Repo.get(User, id)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
end

