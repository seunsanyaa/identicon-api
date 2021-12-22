defmodule Identiconapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Identiconapi.Repo,
      # Start the Telemetry supervisor
      IdenticonapiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Identiconapi.PubSub},
      # Start the Endpoint (http/https)
      IdenticonapiWeb.Endpoint
      # Start a worker by calling: Identiconapi.Worker.start_link(arg)
      # {Identiconapi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Identiconapi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IdenticonapiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
