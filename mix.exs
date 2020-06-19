defmodule UeberauthExample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ueberauth_example,
      version: "0.0.1",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {UeberauthExample, []},
      applications: [
        :phoenix,
        :phoenix_html,
        :cowboy,
        :logger,
        :phoenix_ecto,
        :postgrex,
        :oauth,
        :ueberauth_facebook,
        :ueberauth_google,
        :ueberauth_github,
        :ueberauth_identity,
        :ueberauth_slack,
        :ueberauth_twitter
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.3"},
      {:phoenix_ecto, "~> 4.1"},
      {:plug_cowboy, "~> 1.0"},
      {:postgrex, "~> 0.15"},
      {:ecto_sql, "~> 3.3"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2.1", only: :dev},
      {:phoenix_pubsub, "~> 2.0"},
      {:cowboy, "~> 1.0"},
      {:ueberauth, "~> 0.6.3"},
      {:oauth2, "~> 2.0", override: true},
      {:oauth, github: "tim/erlang-oauth"},
      {:oauther, "~> 1.1", override: true},
      {:ueberauth_facebook, "~> 0.8"},
      {:ueberauth_google, "~> 0.9"},
      {:ueberauth_github, "~> 0.8"},
      {:ueberauth_identity, "~> 0.3"},
      {:ueberauth_slack, "~> 0.6"},
      {:ueberauth_twitter, "~> 0.4"},
      {:poison, "~> 3.0", override: true},
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
