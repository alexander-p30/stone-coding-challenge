defmodule StoneChallenge.DataGeneration.Emails do
  @moduledoc """
  Provides functions for email string generation.
  """

  @email_names ["estevan", "vinicius", "giuliana", "joao", "arthur", "clara"]
  @email_domains ["@amail.com", "@bmail.com", "@cmail.com", "@dmail.com"]

  @doc """
  Returns a random string representing an email name.

  ## Example

    iex> StoneChallenge.DataGeneration.Emails.generate_name()
    "estevan"

  """
  @spec generate_name :: String.t()
  def generate_name, do: Enum.random(@email_names)

  @doc """
  Returns a random string representing an email domain.

  ## Examples

    iex> StoneChallenge.DataGeneration.Emails.generate_domain()
    "@dmail.com"

  """
  @spec generate_domain :: String.t()
  def generate_domain, do: Enum.random(@email_domains)
end
