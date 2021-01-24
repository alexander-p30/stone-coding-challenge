defmodule StoneChallenge.DataGeneration do
  @moduledoc """
  Interface for interacting with data generating modules.
  """

  alias StoneChallenge.DataGeneration.{Lists}

  @doc """
  Returns a list of specified type.

  ## Parameters

  - type: atom representing type of list to be generated.
  - ammount: integer representing the ammount of elements of specified type in the generated list.

  """
  @spec list(:email | :purchase_item, integer) :: [
          String.t() | StoneChallenge.CostManaging.PurchaseItem.t()
        ]
  def list(type, ammount \\ Enum.random(1..10)) do
    Lists.type(type, ammount)
  end
end
