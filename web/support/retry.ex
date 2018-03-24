defmodule Support.Retry do

  def retry(task, retries \\ 0, delay \\ 1000) do
    case task.() do
      {:ok, result} -> {:ok, result}
      {:error, error} ->
        if retries > 0 do
          :timer.sleep(500)
          retry(task, retries - 1, delay)
        else
          {:error, error}
        end
    end    
  end
end
