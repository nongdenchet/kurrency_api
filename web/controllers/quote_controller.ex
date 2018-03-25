defmodule Kurrency.QuoteController do
  use Kurrency.Web, :controller

  alias Kurrency.LoadQuote

  plug :require_authenticate when action in [:latest]

  def latest(conn, _params) do
    quote = LoadQuote.execute

    render(conn, "quote.json", quote: quote)
  end
end
