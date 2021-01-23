defmodule StoneChallenge.DataGeneration do
  @moduledoc """
  Interface for interacting with data generating modules.
  """

  alias StoneChallenge.DataGeneration.{Lists}

  @doc """
  Returns a list of strings representing emails.

  ## Parameters

  - ammount_of_emails: optional parameter that sets the ammount of emails to be present in the list.
  """
  @spec email_list(integer) :: [String.t()]
  def email_list(ammount_of_emails \\ Enum.random(1..5)),
    do: Lists.emails(ammount_of_emails)

  @doc """
  Returns a list of StoneChallenge.CostManaging.PurchaseItem structs.

  ## Parameters

  - ammount_of_items: optional parameter that sets the ammount of structs to be present in the list.
  """
  @spec purchase_list(integer) :: [StoneChallenge.CostManaging.PurchaseItem.t()]
  def purchase_list(ammount_of_items \\ Enum.random(1..10)),
    do: Lists.purchase(ammount_of_items)
end
