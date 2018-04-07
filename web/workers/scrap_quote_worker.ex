defmodule Kurrency.ScrapQuoteWorker do
  use GenServer

  alias Kurrency.ScrapQuote

  @one_hour 60 * 60 * 1000

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    scrap_data()
    schedule_work()
    {:noreply, state}
  end

  defp scrap_data do
    case ScrapQuote.execute do
      {:ok, result} -> IO.inspect(result)
      {:error, reason} -> IO.inspect(reason)
      {:error, :quote, changeset, %{}} -> IO.inspect(changeset)
      {:error, :currencies, changeset, %{}} -> IO.inspect(changeset)
    end
  end

  defp schedule_work() do
    Process.send_after(self(), :work, @one_hour)
  end
end
