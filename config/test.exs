use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :push_app, PushAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :push_app, PushApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "push_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
