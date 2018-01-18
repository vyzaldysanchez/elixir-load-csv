# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :push_app,
  ecto_repos: [PushApp.Repo]

# Configures the endpoint
config :push_app, PushAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lYtr+8hjVQjiqScD6Fmbh+V8hRAcvhSKLwrDzNdwlEUJF/OC4HFnqTT6PraStZC4",
  render_errors: [view: PushAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PushApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
