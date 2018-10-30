defmodule AlpacaWeb.AddressView do
  use AlpacaWeb, :view
  alias AlpacaWeb.AddressView

  def render("index.json", %{addresses: addresses}) do
    %{data: render_many(addresses, AddressView, "address.json")}
  end

  def render("show.json", %{address: address}) do
    %{data: render_one(address, AddressView, "address.json")}
  end

  def render("address.json", %{address: address}) do
    %{id: address.id,
      addr1: address.addr1,
      addr2: address.addr2,
      postcode: address.postcode,
      city: address.city}
  end
end
