defmodule HistoryMapsWeb.MapView do
  use HistoryMapsWeb, :view
  alias HistoryMaps.Maps

  def static_map_path(map_title, user_name) do
    IO.inspect map_title, label: "map title:"
    "/maps/#{user_name}/#{Maps.make_map_file_name(map_title)}"
#    "/maps/deanch/TestMap.html"
  end

end

