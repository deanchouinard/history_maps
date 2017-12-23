defmodule HistoryMapsWeb.DisplayView do
  use HistoryMapsWeb, :view

  def j_decode(data) do
    Poison.encode!(data)
  end

end
