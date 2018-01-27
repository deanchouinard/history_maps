defmodule HistoryMapsWeb.DisplayController do
  use HistoryMapsWeb, :controller
  alias HistoryMaps.Maps

  plug :authenticate_user when action in [:index, :show, :new, :create]

  def show(conn, %{"id" => id, "pub" => pub}) do
    map = Maps.get_map(id, conn.assigns.current_user)
    markers = Maps.list_markers(map)
              |> Enum.map(fn(x) -> %{"id" => x.id, "title" => x.title, "desc" =>
    x.description, "lat" => x.lat, "lng" => x.lng } end)
    # markers = %{"markers" => markers}
    # markers = %{"id" => 1, "title" => "Test", "desc" => "Test Map", "lat" =>
     # 41.779430, "lng" => -71.128605}
    # markers = '{ "name":"John", "age":31, "city":"New York" }'
    IO.inspect markers, label: "markers"
    if (pub == "true") do
      disp_page = Phoenix.View.render_to_string HistoryMapsWeb.DisplayView ,
      "show.html", layout: {HistoryMapsWeb.LayoutView, "pub.html"}, map: map,
      markers: markers, conn: conn
      IO.inspect disp_page
      Maps.publish_page(disp_page, map.title, conn.assigns.current_user.name)
      render conn, "show.html", layout: {HistoryMapsWeb.LayoutView, "pub.html"}, map: map, markers: markers
    else
      render conn, "show.html", map: map, markers: markers
    end
  end


end
