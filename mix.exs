defmodule JsonApi.Mixfile do
  use Mix.Project

  def project do
    [app: :json_api,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [
      applications: [:plug, :cowboy, :poison],
      mod: {JsonApi, []},
    ]
  end

  defp deps do
    [
      {:plug, ">= 0.8.0"},
      {:cowboy, ">= 1.0.0"},
      {:poison, ">= 1.3.0"}
    ]
  end
end
