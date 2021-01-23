defmodule StoneChallenge.CostManaging do
  @moduledoc """
  Interface for interacting with cost managing modules.
  """

  alias StoneChallenge.CostManaging.{Divisor, PurchaseItem}

  @doc """
  Returns a map of String => integer structure, representing the divided price to be paid by each 'email'.

  ## Parameters

  - purchase_list: list of StoneChallenge.CostManaging.PurchaseItem structs
  - emails: list of strings

  """
  @spec divide_costs_among_emails([StoneChallenge.CostManaging.PurchaseItem.t()], [String.t()]) ::
          {:error, String.t()} | {:ok, %{String.t() => integer}}
  def divide_costs_among_emails(purchase_list, emails_list),
    do: Divisor.cost_by_email(purchase_list, emails_list)

  @doc """
  Returns a struct of StoneChallenge.CostManaging.PurchaseItem type.

  ## Parameters

  - attrs: map with name as string, quantity as integer and unit_price_in_cents as integer.

  """
  @spec create_purchase_item(%{
          name: String.t(),
          quantity: integer(),
          unit_price_in_cents: integer()
        }) ::
          {:error, String.t()} | {:ok, StoneChallenge.CostManaging.PurchaseItem.t()}
  def create_purchase_item(%{name: name, quantity: qtt, unit_price_in_cents: price} = _attrs),
    do: {:ok, %PurchaseItem{name: name, quantity: qtt, unit_price_in_cents: price}}

  def create_purchase_item(_),
    do: {:error, "Please provide a map with #{Enum.join(PurchaseItem.necessary_keys(), ", ")}."}
end
