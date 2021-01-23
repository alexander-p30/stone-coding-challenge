defmodule StoneChallenge.CostManagingTest do
  use ExUnit.Case

  alias StoneChallenge.CostManaging
  alias StoneChallenge.CostManaging.PurchaseItem

  describe "create_purchase_item" do
    test "returns a PurchaseItem struct when all necessary keys are present" do
      assert {:ok, %PurchaseItem{} = created_item} =
               CostManaging.create_purchase_item(%{
                 name: "Banana",
                 quantity: 4,
                 unit_price_in_cents: 461
               })

      assert created_item.name == "Banana"
      assert created_item.quantity == 4
      assert created_item.unit_price_in_cents == 461
    end

    test "returns error when not all necessary keys are present" do
      assert {:error, _} = CostManaging.create_purchase_item(%{name: "Banana"})
    end
  end

  describe "divide_costs_among_emails" do
    setup do
      %{
        purchase_list: [
          %PurchaseItem{name: "Banana", quantity: 4, unit_price_in_cents: 461},
          %PurchaseItem{name: "Pineapple", quantity: 1, unit_price_in_cents: 500}
        ],
        emails_list: ["a@mail.com", "b@mail.com", "c@mail.com"],
        total_cost: 2344
      }
    end

    test "returns total_cost divided among emails when parameters are valid", %{
      purchase_list: purchase_list,
      emails_list: emails_list,
      total_cost: total_cost
    } do
      assert {:ok, %{} = cost_distribution} =
               CostManaging.divide_costs_among_emails(purchase_list, emails_list)

      assert Map.keys(cost_distribution) == emails_list

      assert %{"a@mail.com" => cost_a, "b@mail.com" => cost_b, "c@mail.com" => cost_c} =
               cost_distribution

      assert cost_a + cost_b + cost_c == total_cost
    end
  end
end
