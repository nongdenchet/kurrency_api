defmodule Kurrency.WelcomeView do
  use Kurrency.Web, :view

  def render("welcome.json", _params) do
    %{
      title: "Welcome to Kurrency",
    }
  end
end
