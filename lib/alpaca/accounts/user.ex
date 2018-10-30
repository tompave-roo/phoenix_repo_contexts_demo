defmodule Alpaca.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Alpaca.Accounts.Address


  schema "users" do
    field :age, :integer
    field :name, :string

    timestamps()

    has_one :address, Address
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
