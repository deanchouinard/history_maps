defmodule HistoryMaps.Maps do
  alias HistoryMaps.Maps.Map
  alias HistoryMaps.Maps.Marker
  alias HistoryMaps.Maps.Location
  alias HistoryMaps.Accounts.User
  alias HistoryMaps.Repo

  def publish_page(page, map_title, user_name) do
    root_dir = System.cwd() <> "/priv/static/maps/"
    work_dir = root_dir <> String.replace(user_name, " ", "") <> "/"
    map_file_name = make_map_file_name(map_title)
    if not File.exists?(work_dir) do
      File.mkdir_p!(work_dir)
    end
    File.write!(work_dir <> map_file_name, page)
  end

  def make_map_file_name(map_title), do: String.replace(map_title, " ", "") <> ".html"

  def list_maps(user) do
    Repo.all(user_maps(user))
  end

  def get_map(id, user) do
    Repo.get(user_maps(user), id)
    #Repo.get(Map, id)
  end

  def change_map(%Map{} = map) do
    map
    |> Map.map_changeset(%{})
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

  def update_map(%Map{} = map, attrs) do
    map
    |> Map.map_changeset(attrs)
    |> Repo.update
  end


  def list_markers(map) do
    Repo.all(map_markers(map))
  end

  def new_marker(user, map_id) do
    user
    |> Ecto.build_assoc(:markers)
    |> Marker.changeset(%{map_id: map_id})
  end

  def create_marker(attrs \\ %{}, user, map_id) do
    user
    |> Ecto.build_assoc(:markers)
    |> Marker.changeset(Kernel.put_in(attrs, ["map_id"], map_id))
    |> Repo.insert()
  end

  def get_marker(id, user) do
    Repo.get(user_markers(user), id)
  end

  def change_marker(%Marker{} = marker) do
    marker
    |> Marker.marker_changeset(%{})
  end

  def update_marker(%Marker{} = marker, attrs) do
    marker
    |> Marker.marker_changeset(attrs)
    |> Repo.update
  end

  defp user_markers(user), do: Ecto.assoc(user, :markers)

  defp map_markers(map) do
    Ecto.assoc(map, :markers)
  end

  def list_locations(user) do
    Repo.all(user_locations(user))
  end

  def get_location(id, user) do
    Repo.get(user_locations(user), id)
  end

  def new_location(user) do
    user
    |> Ecto.build_assoc(:locations)
    |> Location.changeset()
  end

  def create_location(attrs \\ %{}, user) do
    user
    |> Ecto.build_assoc(:locations)
    |> Location.changeset(attrs)
    |> Repo.insert()
  end


  defp user_maps(user) do
    Ecto.assoc(user, :maps)
  end

  defp user_locations(user) do
    Ecto.assoc(user, :locations)
  end
  
end

