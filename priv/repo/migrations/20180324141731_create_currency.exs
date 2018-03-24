defmodule Kurrency.Repo.Migrations.CreateCurrency do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :name, :string
      add :value, :decimal
      add :quote_id, references(:quotes, on_delete: :nothing)

      timestamps()
    end
    create index(:currencies, [:quote_id])

  end
end
