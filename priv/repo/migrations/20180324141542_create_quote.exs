defmodule Kurrency.Repo.Migrations.CreateQuote do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :source, :string
      add :timestamp, :integer

      timestamps()
    end

  end
end
