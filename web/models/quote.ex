defmodule Kurrency.Quote do
  use Kurrency.Web, :model

  schema "quotes" do
    field :source, :string
    field :timestamp, :integer
    has_many :currencies, Kurrency.Currency

    timestamps()
  end

  @required_fields [:source, :timestamp]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
  end
end
