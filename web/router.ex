defmodule Kurrency.Router do
  use Kurrency.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Kurrency.TokenPlug
  end

  scope "/api", Kurrency do
    pipe_through :api

    get "/latest", QuoteController, :latest
    get "/welcome", WelcomeController, :welcome
  end
end
