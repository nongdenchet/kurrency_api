defmodule Kurrency.QuoteTest do
  use Kurrency.ModelCase

  alias Kurrency.Quote

  @valid_attrs %{source: "some content", timestamp: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Quote.changeset(%Quote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Quote.changeset(%Quote{}, @invalid_attrs)
    refute changeset.valid?
  end
end
