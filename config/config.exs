use Mix.Config

log_level = :debug

config :logger,
  level: log_level

config :logger, :console,
  format: "$date $time [$level] $message\n"
