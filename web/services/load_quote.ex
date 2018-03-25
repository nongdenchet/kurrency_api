defmodule Kurrency.LoadQuote do
  import Ecto.Query

  alias Kurrency.Repo
  alias Kurrency.Quote
  alias Kurrency.Currency

  def execute do
    Quote
    |> last(:inserted_at)
    |> Repo.one
    |> Repo.preload(:currencies)
  end
end
