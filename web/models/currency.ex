defmodule Kurrency.Currency do
  use Kurrency.Web, :model

  schema "currencies" do
    field :name, :string
    field :value, :decimal
    belongs_to :quote, Kurrency.Quote

    timestamps()
  end

  @required_fields [:name, :value, :quote_id]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
