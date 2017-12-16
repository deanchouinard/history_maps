# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HistoryMaps.Repo.insert!(%HistoryMaps.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias HistoryMaps.Accounts.User
alias HistoryMaps.Repo
alias HistoryMaps.Maps.Map
alias HistoryMaps.Maps.Location
alias HistoryMaps.Maps.Marker

Repo.delete_all User

user = %User{}
|> User.registration_changeset(%{ name: "deanch", username: "deanch", password: "deanch" })
|> Repo.insert!()

IO.inspect user

Repo.delete_all Map
map = %Map{}
      |> Map.changeset(%{ user_id: user.id, title: "Test Map" })
      |> Repo.insert!()

IO.inspect map

Repo.delete_all Location
location = %Location{}
  |> Location.changeset(%{ user_id: user.id, title: "Test Location",
      lat: 22.2345, lng: 44.4985})
  |> Repo.insert!()

IO.inspect location

Repo.delete_all Marker
marker = %Marker{}
  |> Marker.changeset(%{user_id: user.id, map_id: map.id, 
      title: "Test Marker",
      lat: 22.2345, lng: 44.4985})
  |> Repo.insert!()

IO.inspect marker

