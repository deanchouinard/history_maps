defmodule HistoryMapsWeb.MapController do
  use HistoryMapsWeb, :controller
  alias HistoryMaps.Maps

  plug :authenticate_user when action in [:index, :show]

  # def index(conn, _params) do
  #   users = Accounts.list_users()
  #   render conn, "index.html", users: users
  # end

  def show(conn, %{"id" => id}) do
    map = Maps.get_map(id)
    render conn, "show.html", map: map
  end

  # def new(conn, _params) do
  #   changeset = Accounts.User.changeset(%Accounts.User{})
  #   render conn, "new.html", changeset: changeset
  # end
  #
  # def create(conn, %{"user" => user_params}) do
  #   case Accounts.create_user(user_params) do
  #     {:ok, user} ->
  #       conn
  #       |> HistoryMapsWeb.Auth.login(user)
  #       |> put_flash(:info, "#{user.name} created!")
  #       |> redirect(to: user_path(conn, :index))
  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end


end

