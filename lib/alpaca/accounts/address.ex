defmodule Alpaca.Accounts.Address do
  use Ecto.Schema
  import Ecto.Changeset
  alias Alpaca.Accounts.User


  schema "addresses" do
    field :addr1, :string
    field :addr2, :string
    field :city, :string
    field :postcode, :string

    timestamps()

    belongs_to :user, User
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:addr1, :addr2, :postcode, :city])
    |> validate_required([:addr1, :postcode, :city, :user_id])
  end
end
