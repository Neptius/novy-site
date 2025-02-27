import Config

config :novy_core, NovyCore.Repo,
  username: "postgres",
  password: "pass",
  hostname: "localhost",
  database: "novy_core_repo",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
