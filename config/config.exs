# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :share_half,
  ecto_repos: [ShareHalf.Repo]

# Configures the endpoint
config :share_half, ShareHalf.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aIvLypvdcozFrbjuFYNgcTCJbrrrFn3IlxhljebHHe3qN8EF5/sGmWfrvp1jP23j",
  render_errors: [view: ShareHalf.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ShareHalf.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Config Oauth
config :ueberauth, Ueberauth,
  providers: [
    facebook: { Ueberauth.Strategy.Facebook, [
        default_scope: "email,public_profile,user_friends"
      ]
    }
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("SH_FACEBOOK_APP_ID"),
  client_secret: System.get_env("SH_FACEBOOK_APP_SECRET"),
  redirect_uri: System.get_env("SH_FACEBOOK_REDIRECT_URI")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
