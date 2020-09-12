# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :refpa2,
  ecto_repos: [RefPA2.Repo]

config :refpa2, RefPA2.Repo,
  pool_size: 10,
  log: false

# Configures the endpoint
config :refpa2, RefPA2Web.Endpoint,
  http: [:inet6, port: 4000],
  url: [host: "localhost"],
  render_errors: [view: RefPA2Web.ErrorView, accepts: ~w(html json)],
  pubsub_server: RefPA2.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :gettext, :default_locale, "de"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
