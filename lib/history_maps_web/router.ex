defmodule HistoryMapsWeb.Router do
  use HistoryMapsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HistoryMapsWeb.Auth, repo: HistoryMaps.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HistoryMapsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/maps", MapController, only: [:index, :show, :new, :create] do
      resources "/markers", MarkerController, only: [:index, :show, :new, :create]
    end
    resources "/locations", LocationController, only: [:index, :show, :new, :create]
    get "/display", DisplayController, :show

  end

  # Other scopes may use custom stacks.
  # scope "/api", HistoryMapsWeb do
  #   pipe_through :api
  # end
end
