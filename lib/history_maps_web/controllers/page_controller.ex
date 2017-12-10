defmodule HistoryMapsWeb.PageController do
  use HistoryMapsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
