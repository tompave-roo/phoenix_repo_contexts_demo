defmodule AlpacaWeb.Router do
  use AlpacaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AlpacaWeb do
    pipe_through :api
  end
end
