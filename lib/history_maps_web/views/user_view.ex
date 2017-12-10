defmodule HistoryMapsWeb.UserView do
  use HistoryMapsWeb, :view
  alias HistoryMaps.Accounts.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end

