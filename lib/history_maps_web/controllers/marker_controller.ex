defmodule HistoryMapsWeb.MarkerController do
  use HistoryMapsWeb, :controller
  alias HistoryMaps.Maps

  plug :authenticate_user when action in [:index, :show, :edit, :update, :new, :create]

  # def index(conn, _params) do
  #   users = Accounts.list_users()
  #   render conn, "index.html", users: users
  # end

  def show(conn, %{"id" => id}, user) do
    marker = Maps.get_marker(id, user)
    render conn, "show.html", marker: marker
  end

  def new(conn, %{"map_id" => map_id}, user) do
    changeset = Maps.new_marker(user, map_id)
    render conn, "new.html", changeset: changeset, map_id: map_id
  end

  def create(conn, %{"marker" => marker_params, "map_id" => map_id}, user) do
    case Maps.create_marker(marker_params, user, map_id) do
      {:ok, marker} ->
        conn
        |> put_flash(:info, "Marker #{marker.title} created!")
        |> redirect(to: map_marker_path(conn, :show, map_id, marker.id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
  
  def edit(conn, %{"id" => id}, user) do
    marker = Maps.get_marker(id, user)
    changeset = Maps.change_marker(marker)
    render conn, "edit.html", changeset: changeset, marker: marker, map:
    marker.map_id
  end

  def update(conn, %{"id" => id, "marker" => marker_params}, user) do
    marker = Maps.get_marker(id, user)

    case Maps.update_marker(marker, marker_params) do
      {:ok, marker} ->
        conn
        |> put_flash(:info, "Marker updated successfully.")
        |> redirect(to: map_path(conn, :show, marker.map_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", changeset: changeset, marker: marker)
    end
  end


  def action(conn, _) do apply(__MODULE__, action_name(conn),
    [conn, conn.params, conn.assigns.current_user])
  end
end

