defmodule Kurrency.PageController do
  use Kurrency.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
