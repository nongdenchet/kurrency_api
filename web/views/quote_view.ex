defmodule Kurrency.QuoteView do
  use Kurrency.Web, :view

  alias Kurrency.CurrencyView

  def render("quote.json", %{quote: quote}) do
    currencies = CurrencyView.render("currencies.json", %{currencies: quote.currencies})

    %{
      source: quote.source,
      timestamp: quote.timestamp,
      quotes: currencies
    }
  end
end
