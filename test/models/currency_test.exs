defmodule Kurrency.CurrencyTest do
  use Kurrency.ModelCase

  alias Kurrency.Currency

  @valid_attrs %{name: "some content", value: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Currency.changeset(%Currency{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Currency.changeset(%Currency{}, @invalid_attrs)
    refute changeset.valid?
  end
end
