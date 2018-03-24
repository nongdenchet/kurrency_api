defmodule Adapter.KurrencyApi do
  import HTTPoison
  import Poison
  import Support.Retry

  def fetch do
    Support.Retry.retry(fetch_task, 3, 500)
  end

  defp fetch_task do
    fn ->
      api_key
      |> url
      |> call
    end
  end

  defp call(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.Parser.parse!(body)}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp url(api_key) do
    "http://apilayer.net/api/live?access_key=#{api_key}"
  end

  defp api_key do
    Application.get_env(:kurrency, Kurrency.Endpoint)[:api_key]
  end
end
