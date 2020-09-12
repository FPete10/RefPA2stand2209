use Mix.Config

# Configure your database
config :refpa2, RefPA2.Repo, pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :refpa2, RefPA2Web.Endpoint,
  http: [port: 4002],
  server: false,
  secret_key_base: "UrwGy41yrDwJsejSAcTrlVTIbyAUDZzIT5LQheRbcE6tltjuHKSnONcHvlX9+BwY"

config :refpa2, RefPA2.Mailer,
  adapter: Bamboo.TestAdapter

# Print only warnings and errors during test
config :logger, level: :warn
