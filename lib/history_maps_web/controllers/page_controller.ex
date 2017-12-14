defmodule HistoryMapsWeb.PageController do
  use HistoryMapsWeb, :controller

  def index(conn, _params) do
    {maps, locations} = if conn.assigns.current_user do
      {HistoryMaps.Maps.list_maps(conn.assigns.current_user), 
        HistoryMaps.Maps.list_locations(conn.assigns.current_user)}
    else
      {[], []}
    end

    render conn, "index.html", maps: maps, locations: locations
  end
end
