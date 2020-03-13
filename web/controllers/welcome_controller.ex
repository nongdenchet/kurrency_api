defmodule Kurrency.WelcomeController do
  use Kurrency.Web, :controller

  def welcome(conn, _params) do
    render(conn, "welcome.json", %{})
  end
end
