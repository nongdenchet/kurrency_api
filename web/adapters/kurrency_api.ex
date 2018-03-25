defmodule Adapter.KurrencyApi do
  import HTTPoison
  import Poison

  def fetch do
    api_key
    |> url
    |> call
  end

  defp call(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        result = Poison.Parser.parse!(body)
        if (result["success"]) do
          {:ok, result}
        else
          {:error, result["error"]}
        end
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
