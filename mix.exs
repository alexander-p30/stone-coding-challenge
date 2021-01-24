defmodule StoneChallenge.MixProject do
  use Mix.Project

  def project do
    [
      app: :stone_challenge,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        nest_modules_by_prefix: [
          StoneChallenge,
          StoneChallenge.CostManaging,
          StoneChallenge.DataGeneration
        ]
      ]
    ]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.23", runtime: false}
    ]
  end
end
