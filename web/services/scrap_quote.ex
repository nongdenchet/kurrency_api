defmodule Kurrency.ScrapQuote do
  alias Kurrency.Repo
  alias Kurrency.Quote
  alias Kurrency.Currency
  alias Ecto.Multi
  alias Support.Retry
  alias Adapter.KurrencyApi

  def execute do
    fetch_task = fn ->
      KurrencyApi.fetch
    end

    case Retry.retry(fetch_task, 3, 500) do
      {:ok, data} -> insert_data(data)
      {:error, reason} -> {:error, reason}
    end
  end

  defp insert_data(%{"source" => source, "timestamp" => timestamp, "quotes" => currecies}) do
    Multi.new
    |> Multi.delete_all(:delete_currecies, Currency)
    |> Multi.delete_all(:delete_quotes, Quote)
    |> Multi.run(:quote, &insert_quote(&1, source, timestamp))
    |> Multi.run(:currecies, &insert_currencies(&1.quote, currecies))
    |> Repo.transaction
  end

  defp insert_quote(_, source, timestamp) do
    changeset = Quote.changeset(%Quote{}, %{source: source, timestamp: timestamp})

    Repo.insert(changeset)
  end

  defp insert_currencies(quote, currecies) do
    changesets = Enum.map currecies, fn {key, value} ->
      %{name: key, value: value, quote_id: quote.id}
        |> Map.put(:inserted_at, Timex.now)
        |> Map.put(:updated_at, Timex.now)
    end

    {:ok, Repo.insert_all(Currency, changesets)}
  end
end
