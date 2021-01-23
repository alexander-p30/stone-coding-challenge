defmodule StoneChallenge.DataGeneration.Lists do
  @moduledoc """
  Provides functions for lists of unique email strings or PurchaseItem structs.
  """

  alias StoneChallenge.DataGeneration.{Emails, PurchaseItems}

  @doc """
  Generates a list of numberend, and thus unique, strings representing emails.

  ## Parameters

    - ammount_of_emails: Integer with number of emails to be returned in the list.

  ## Examples

    iex> StoneChallenge.DataGeneration.Lists.emails(2)
    ["estevan1@amail.com", "vinicius2@bmail.com"]
  """
  @spec emails(integer) :: [String.t()]
  def emails(ammount_of_emails) when not is_integer(ammount_of_emails),
    do: raise(ArgumentError, "Please provide an integer.")

  def emails(ammount_of_emails) when ammount_of_emails < 1,
    do: raise(ArgumentError, "Please provide an integer equal or higher than 1.")

  def emails(ammount_of_emails) do
    Enum.map(
      1..ammount_of_emails,
      &(Emails.generate_name() <> "#{&1}" <> Emails.generate_domain())
    )
  end

  @doc """
  Generates a list of StoneChallenge.CostManaging.PurchaseItem structs.

  ## Parameters

    - ammount_of_items: Integer with number of items to be returned in the list.

  ## Example

    iex> StoneChallenge.DataGeneration.Lists.purchase(3)
    [
      %StoneChallenge.CostManaging.PurchaseItem{
        name: "Mango",
        quantity: 2,
        unit_price_in_cents: 50
      },
      %StoneChallenge.CostManaging.PurchaseItem{
        name: "Banana",
        quantity: 2,
        unit_price_in_cents: 360
      },
      %StoneChallenge.CostManaging.PurchaseItem{
        name: "Pineapple",
        quantity: 5,
        unit_price_in_cents: 3900
      }
    ]
  """
  @spec purchase(integer) :: [StoneChallenge.CostManaging.PurchaseItem.t()]
  def purchase(ammount_of_items) when not is_integer(ammount_of_items),
    do: raise(ArgumentError, "Please provide an integer.")

  def purchase(ammount_of_items) when ammount_of_items < 1,
    do: raise(ArgumentError, "Please provide an integer equal or higher than 1.")

  def purchase(ammount_of_items) do
    Enum.map(
      1..ammount_of_items,
      fn _ -> PurchaseItems.generate() end
    )
  end
end
