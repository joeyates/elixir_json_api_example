defmodule JsonApi.Mixfile do
  use Mix.Project

  def project do
    [app: :json_api,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:cowboy, :ranch, :httpoison]]
  end

  defp deps do
    [
      {:cowboy, ">= 1.0.0"},
      {:httpoison, ">= 0.5.0"},
      {:poison, ">= 1.3.0"}
    ]
  end
end
