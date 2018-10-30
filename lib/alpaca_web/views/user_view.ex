defmodule AlpacaWeb.UserView do
  use AlpacaWeb, :view
  alias AlpacaWeb.UserView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    render_one(user, UserView, "user.json")
  end

  def render("user.json", %{user: user = %{ address: address }}) do
    %{
      id: user.id,
      name: user.name,
      age: user.age,
      address: render_one(address, AlpacaWeb.AddressView, "address.json")
    }
  end
end
