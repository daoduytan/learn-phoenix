defmodule Demo1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Demo1Web.Telemetry,
      Demo1.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:demo1, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:demo1, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Demo1.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Demo1.Finch},
      # Start a worker by calling: Demo1.Worker.start_link(arg)
      # {Demo1.Worker, arg},
      # Start to serve requests, typically the last entry
      Demo1Web.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Demo1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Demo1Web.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
