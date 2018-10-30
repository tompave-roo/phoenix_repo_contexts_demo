defmodule Alpaca.Repo do
  use Ecto.Repo,
    otp_app: :alpaca,
    adapter: Ecto.Adapters.Postgres
end
