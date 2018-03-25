defmodule Kurrency.TokenPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts) do
  end

  def call(conn, repo) do
    token = conn.params["access_key"]
    if token do
      assign(conn, :authenticated, encode(token) == get_system_token)
    else
      assign(conn, :authenticated, false)
    end
  end

  defp encode(value) do
    :crypto.hash(:sha256, value) |> Base.encode16
  end

  def require_authenticate(conn, _opts) do
    if conn.assigns.authenticated do
      conn
    else
      conn
      |> put_status(403)
      |> render(Kurrency.ErrorView, "403.json")
      |> halt()
    end
  end

  defp get_system_token do
    Application.get_env(:kurrency, Kurrency.Endpoint)[:token]
  end
end
