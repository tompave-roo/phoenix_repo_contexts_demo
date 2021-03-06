defmodule AlpacaWeb.AddressController do
  use AlpacaWeb, :controller

  alias Alpaca.Accounts
  alias Alpaca.Accounts.Address

  action_fallback AlpacaWeb.FallbackController

  def index(conn, _params) do
    addresses = Accounts.list_addresses()
    render(conn, "index.json", addresses: addresses)
  end

  def create(conn, %{"address" => address_params}) do
    with {:ok, %Address{} = address} <- Accounts.create_address(address_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.address_path(conn, :show, address))
      |> render("show.json", address: address)
    end
  end

  def show(conn, %{"id" => id}) do
    address = Accounts.get_address!(id)
    render(conn, "show.json", address: address)
  end

  def update(conn, %{"id" => id, "address" => address_params}) do
    address = Accounts.get_address!(id)

    with {:ok, %Address{} = address} <- Accounts.update_address(address, address_params) do
      render(conn, "show.json", address: address)
    end
  end

  def delete(conn, %{"id" => id}) do
    address = Accounts.get_address!(id)

    with {:ok, %Address{}} <- Accounts.delete_address(address) do
      send_resp(conn, :no_content, "")
    end
  end
end
