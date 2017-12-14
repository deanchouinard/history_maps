defmodule HistoryMapsWeb.LocationController do
  use HistoryMapsWeb, :controller
  alias HistoryMaps.Maps

  plug :authenticate_user when action in [:index, :show, :new, :create]

  # def index(conn, _params) do
  #   users = Accounts.list_users()
  #   render conn, "index.html", users: users
  # end

  def show(conn, %{"id" => id}, user) do
    location = Maps.get_location(id, user)
    render conn, "show.html", location: location
  end

  def new(conn, _params, user) do
    changeset = Maps.new_location(user)
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"location" => location_params}, user) do
    case Maps.create_location(location_params, user) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "#{location.title} created!")
        |> redirect(to: location_path(conn, :show, location))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def action(conn, _) do apply(__MODULE__, action_name(conn),
    [conn, conn.params, conn.assigns.current_user])
  end
end

