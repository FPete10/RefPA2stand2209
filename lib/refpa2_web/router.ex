defmodule RefPA2Web.Router do
  use RefPA2Web, :router

  import Phoenix.LiveDashboard.Router

  pipeline :unsecure_browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser do
    plug(RefPA2Web.Authentication, type: :api_or_browser, forward_to_login: false)
  end

  pipeline :protected_browser do
    plug(RefPA2Web.Authentication, type: :api_or_browser, forward_to_login: true)
  end

  pipeline :admins_only do
    plug(RefPA2Web.Authentication, type: :api_or_browser, forward_to_login: true)
    plug(RefPA2Web.AdminOnly)
  end

  # pipeline :api do
  #   plug :accepts, ["json"]
  # end

  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug

    scope "/" do
      pipe_through([:unsecure_browser, :admins_only])
      live_dashboard "/dashboard"
    end
  end

  scope "/", RefPA2Web do
    pipe_through([:unsecure_browser, :browser])

    get "/", PageController, :index
  end

  scope "/public", RefPA2Web, as: :public do
    pipe_through([:unsecure_browser, :browser])

    resources("/users", UserController, only: [:new, :create])
    resources("/sessions", SessionController, only: [:new, :create])

    resources(
      "/password_reset_tokens",
      PasswordResetTokenController,
      only: [:new, :create, :show, :update]
    )
  end

  scope "/", RefPA2Web do
    pipe_through([:unsecure_browser, :protected_browser])

    resources "/sessions", SessionController, only: [:delete]
  end
end
