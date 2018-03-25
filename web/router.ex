defmodule Kurrency.Router do
  use Kurrency.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Kurrency do
    pipe_through :browser
  end

  scope "/api", Kurrency do
    pipe_through :api

    get "/latest", QuoteController, :latest
  end
end
