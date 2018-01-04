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
      |> Map.changeset(%{ user_id: user.id, title: "Test Map", lat: 41.779430,
        lng: -71.128605, zoom: 10, description: "This is a test map.",
        api_key: "AIzaSyDMhzzxiqp3uz_4K0ahxV1FFJQho0FvOWI" })
      |> Repo.insert!()

IO.inspect map

Repo.delete_all Location
location = %Location{}
  |> Location.changeset(%{ user_id: user.id, title: "Test Location",
      lat: 22.2345, lng: 44.4985})
  |> Repo.insert!()

IO.inspect location

markers = [["Home", "This is my home.", 41.779430, -71.128605],
  ["Swansea", "This is the center of Swansea.", 41.751229, -71.201277],
  ["Somerset", "This is the center of Somerset.", 41.747075, -71.144731],
  ["Warren", "This is Warren.", 41.727604, -71.284206]]

Repo.delete_all Marker
for marker <- markers do
  [title, desc, lat, lng] = marker
  %Marker{}
  |> Marker.changeset(%{user_id: user.id, map_id: map.id, 
      title: title, description: desc,
      lat: lat, lng: lng})
  |> Repo.insert!()
end

# IO.inspect marker

