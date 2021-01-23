defmodule StoneChallenge.DataGeneration.PurchaseItems do
  @moduledoc """
  Provides function for ProductItem struct generation.
  """

  alias StoneChallenge.CostManaging

  @product_names ["Banana", "Apple", "Orange", "Mango", "Pineapple", "Watermelon"]

  @doc """
  Returns a struct of StoneChallenge.CostManaging.PurchaseItem type.

  ## Example

    iex> StoneChallenge.DataGeneration.PurchaseItems.generate()
    %StoneChallenge.CostManaging.PurchaseItem{name: "Mango", quantity: 4, unit_price_in_cents: 650}
  """
  @spec generate :: StoneChallenge.CostManaging.PurchaseItem.t()
  def generate do
    {:ok, purchase_item} =
      CostManaging.create_purchase_item(%{
        name: Enum.random(@product_names),
        quantity: Enum.random(0..5),
        unit_price_in_cents: Enum.random(1..50) * Enum.random([10, 100])
      })

    purchase_item
  end
end
