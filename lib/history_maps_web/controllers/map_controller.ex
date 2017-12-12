defmodule HistoryMapsWeb.MapController do
  use HistoryMapsWeb, :controller
  alias HistoryMaps.Maps

  plug :authenticate_user when action in [:index, :show]

  # def index(conn, _params) do
  #   users = Accounts.list_users()
  #   render conn, "index.html", users: users
  # end

  def show(conn, %{"id" => id}, user) do
    map = Maps.get_map(id, user)
    render conn, "show.html", map: map
  end

  def new(conn, _params, user) do
    changeset = Maps.new_map(user)
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"map" => map_params}, user) do
    case Maps.create_map(map_params, user) do
      {:ok, map} ->
        conn
        |> put_flash(:info, "#{map.title} created!")
        |> redirect(to: map_path(conn, :show, map))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def action(conn, _) do apply(__MODULE__, action_name(conn),
    [conn, conn.params, conn.assigns.current_user])
  end
end

