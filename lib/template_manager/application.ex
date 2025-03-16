defmodule TemplateManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TemplateManagerWeb.Telemetry,
      TemplateManager.Repo,
      {DNSCluster, query: Application.get_env(:template_manager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TemplateManager.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TemplateManager.Finch},
      # Start a worker by calling: TemplateManager.Worker.start_link(arg)
      # {TemplateManager.Worker, arg},
      # Start to serve requests, typically the last entry
      TemplateManagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TemplateManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TemplateManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
