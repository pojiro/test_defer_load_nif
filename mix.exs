defmodule TestDeferLoadNif.MixProject do
  use Mix.Project

  def project do
    [
      app: :test_defer_load_nif,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:elixir_make] ++ Mix.compilers()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.4", runtime: false}
    ]
  end
end
