use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :ueberauth_example, UeberauthExampleWeb.Endpoint,
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/brunch/bin/brunch",
      "watch",
      "--stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ],
  https: [
    port: 443,
    otp_app: :ueberauth_example,
    keyfile: "priv/local_certs/server.key",
    certfile: "priv/local_certs/server.crt"
  ],
  url: [
    scheme: "https", 
    host: "localhost",
    port: 443
  ]#,
  # force_ssl: [
  #   hsts: true#, host: "127.0.0.1:4001"
  # ]

# Watch static and templates for browser reloading.
config :ueberauth_example, UeberauthExampleWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{lib/ueberauth_example_web/views/.*(ex)$},
      ~r{lib/ueberauth_example_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :ueberauth_example, UeberauthExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ueberauth_example_dev",
  hostname: "localhost",
  pool_size: 10
