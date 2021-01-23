defmodule StoneChallenge.CostManaging.PurchaseItemTest do
  use ExUnit.Case

  alias StoneChallenge.CostManaging.PurchaseItem

  describe "required keys" do
    test "defining a PurchaseItem with name, quantity and unit_price_in_cents is successful" do
      assert %PurchaseItem{name: "Banana", quantity: 5, unit_price_in_cents: 200}
    end
  end
end
