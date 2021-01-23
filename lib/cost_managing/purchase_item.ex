defmodule StoneChallenge.CostManaging.PurchaseItem do
  @moduledoc """
  Provides a type for purchase list items.
  """

  @typedoc """
  Type that represents ProductItem structs with name as string, quantity as integer and unit_price_in_cents as integer.
  """

  @type t :: %StoneChallenge.CostManaging.PurchaseItem{
          name: String.t(),
          quantity: integer(),
          unit_price_in_cents: integer()
        }

  @enforce_keys [:name, :quantity, :unit_price_in_cents]
  defstruct([:name, :quantity, :unit_price_in_cents])

  @doc """
  Returns a list of strings representing the necessary keys for creating structs of StoneChallenge.CostManaging.PurchaseItem type.
  """
  @spec necessary_keys :: [String.t()]
  def necessary_keys, do: Enum.map(@enforce_keys, &Atom.to_string(&1))
end
