defmodule Kurrency.CurrencyView do
  use Kurrency.Web, :view

  def render("currencies.json", %{currencies: currencies}) do
    currencies
    |> Enum.map(&render("currency.json", %{currency: &1}))
    |> Map.new
  end

  def render("currency.json", %{currency: currency}) do
    {currency.name, Decimal.to_float(currency.value)}
  end
end
