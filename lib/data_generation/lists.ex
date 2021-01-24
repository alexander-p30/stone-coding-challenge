defmodule StoneChallenge.DataGeneration.Lists do
  @moduledoc """
  Provides functions for lists of unique email strings or PurchaseItem structs.
  """

  alias StoneChallenge.DataGeneration.{Emails, PurchaseItems}

  @doc """
  Generates a list of specified type.

  ## Parameters

    - type: atom representing desired type of list elements.
    - ammount: integer with number of elements of specified type in list.

  ## Examples
    ```
    iex> StoneChallenge.DataGeneration.Lists.type(:email, 2)

    ["estevan1@amail.com", "vinicius2@bmail.com"]

    iex> StoneChallenge.DataGeneration.Lists.type(:purchase_item, 3)

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
    ```
  """
  @spec type(:email | :purchase_item, integer) :: [
          String.t() | StoneChallenge.CostManaging.PurchaseItem.t()
        ]
  def type(type, ammount) do
    case type do
      :email -> emails(ammount)
      :purchase_item -> purchase(ammount)
    end
  end

  defp emails(ammount_of_emails) when not is_integer(ammount_of_emails) or ammount_of_emails < 1,
    do: raise(ArgumentError, "Please provide an integer equal or higher than 1.")

  defp emails(ammount_of_emails) do
    Enum.map(
      1..ammount_of_emails,
      &(Emails.generate_name() <> "#{&1}" <> Emails.generate_domain())
    )
  end

  defp purchase(ammount_of_items) when not is_integer(ammount_of_items) or ammount_of_items < 1,
    do: raise(ArgumentError, "Please provide an integer equal or higher than 1.")

  defp purchase(ammount_of_items) do
    Enum.map(
      1..ammount_of_items,
      fn _ -> PurchaseItems.generate() end
    )
  end
end
