defmodule NovySite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NovySiteWeb.Telemetry,
      NovyCore.Repo,
      {DNSCluster, query: Application.get_env(:novy_site, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NovySite.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: NovySite.Finch},
      # Start a worker by calling: NovySite.Worker.start_link(arg)
      # {NovySite.Worker, arg},
      # Start to serve requests, typically the last entry
      NovySiteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NovySite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NovySiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
