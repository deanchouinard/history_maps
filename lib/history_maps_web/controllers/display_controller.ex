defmodule HistoryMapsWeb.DisplayController do
  use HistoryMapsWeb, :controller
  alias HistoryMaps.Maps

  plug :authenticate_user when action in [:index, :show, :new, :create]

  def show(conn, %{"map" => id}) do
    map = Maps.get_map(id, conn.assigns.current_user)
    markers = Maps.list_markers(map)
    render conn, "show.html", map: map, markers: markers
  end
end
