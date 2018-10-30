defmodule AlpacaWeb.Router do
  use AlpacaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AlpacaWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/addresses", AddressController, except: [:new, :edit]
  end
end
