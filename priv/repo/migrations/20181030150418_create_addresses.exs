defmodule Alpaca.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :addr1, :string
      add :addr2, :string
      add :postcode, :string
      add :city, :string

      timestamps()
    end

  end
end
