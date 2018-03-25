defmodule Kurrency.ErrorView do
  use Kurrency.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  def render("403.json", _assigns) do
    %{
      error: "Invalid Token",
      status: 403
    }
  end

  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
