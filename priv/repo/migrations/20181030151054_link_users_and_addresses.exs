defmodule Alpaca.Repo.Migrations.LinkUsersAndAddresses do
  use Ecto.Migration

  def change do
    alter table(:addresses) do
      add :user_id, references(:users), null: false
    end

    create unique_index(:addresses, :user_id)
  end
end
