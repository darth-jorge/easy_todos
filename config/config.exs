# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :easy_todos,
  ecto_repos: [EasyTodos.Repo]

# Configures the endpoint
config :easy_todos, EasyTodosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qxUN4PEiawg3ED3lRutv8PcspdDcGxG382TgNfcCx0OXhmbN05Q3pLU+/LD5jo0A",
  render_errors: [view: EasyTodosWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: EasyTodos.PubSub,
  live_view: [signing_salt: "pK6NddTY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
