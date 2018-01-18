defmodule PushAppWeb.Router do
  use PushAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "multipart"]
  end

  scope "/", PushAppWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/payment", PageController, :payment
  end

  # Other scopes may use custom stacks.
  # scope "/api", PushAppWeb do
  #   pipe_through :api
  # end
end
