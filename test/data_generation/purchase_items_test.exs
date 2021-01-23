defmodule StoneChallenge.DataGeneration.PurchaseItemsTest do
  use ExUnit.Case

  alias StoneChallenge.DataGeneration.PurchaseItems
  alias StoneChallenge.CostManaging.PurchaseItem

  describe "generate" do
    setup do
      %{purchase_item: PurchaseItems.generate()}
    end

    test "returns a struct of PurchaseItem type", %{purchase_item: generated_item} do
      assert %PurchaseItem{} = generated_item
    end

    test "returns a struct with valid values", %{purchase_item: generated_item} do
      assert is_binary(generated_item.name)
      assert String.length(generated_item.name) > 0
      assert generated_item.quantity >= 0
      assert generated_item.unit_price_in_cents >= 0
    end
  end
end
