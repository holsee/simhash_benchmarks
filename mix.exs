defmodule SimhashBench.MixProject do
  use Mix.Project

  def project do
    [
      app: :simhash_bench,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:benchee, "~> 1.1"},
      {:similarity, git: "https://github.com/preciz/similarity"},
      {:simhash, git: "https://github.com/UniversalAvenue/simhash-ex"},
      {:spirit_fingers, "~>0.4.0"}
    ]
  end
end
