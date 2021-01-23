defmodule StoneChallenge.CostManaging.DivisorTest do
  use ExUnit.Case

  alias StoneChallenge.CostManaging.{Divisor, PurchaseItem}

  describe "cost_by_email return types and structure" do
    test "returns error with no emails" do
      assert {:error, _} = Divisor.cost_by_email([], [])
    end

    test "raises exception when at least one of the arguments is not a list" do
      assert_raise ArgumentError, fn -> Divisor.cost_by_email(1, []) end
      assert_raise ArgumentError, fn -> Divisor.cost_by_email([], 1) end
      assert_raise ArgumentError, fn -> Divisor.cost_by_email(1, 1) end
    end

    test "returns a map with number of keys equal to number of emails" do
      emails = [
        "a@mail.com",
        "b@mail.com",
        "c@mail.com",
        "d@mail.com"
      ]

      assert {:ok, divided_costs_map} = Divisor.cost_by_email([], emails)
      assert length(Map.keys(divided_costs_map)) == 4
    end

    test "returns map with 0 for each of it's keys with empty purchase list" do
      emails = ["email_a@amail.com", "email_b@bmail.com"]

      assert {:ok, divided_costs} = Divisor.cost_by_email([], emails)
      assert %{"email_a@amail.com" => 0} = divided_costs
      assert %{"email_b@bmail.com" => 0} = divided_costs
    end
  end

  describe "cost_by_email map return values" do
    setup do
      %{
        purchase_list: [
          %PurchaseItem{name: "Mango", quantity: 5, unit_price_in_cents: 500},
          %PurchaseItem{name: "Banana", quantity: 1, unit_price_in_cents: 203}
        ],
        total_cost: 2703
      }
    end

    test "returns map with unequal values for each of it's two keys with two emails", %{
      purchase_list: purchase_list,
      total_cost: total_cost
    } do
      emails = ["emaila@amail.com", "emailb@bmail.com"]
      assert {:ok, divided_costs} = Divisor.cost_by_email(purchase_list, emails)
      assert %{"emaila@amail.com" => cost_a, "emailb@bmail.com" => cost_b} = divided_costs
      assert cost_a == cost_b + 1
      assert cost_a + cost_b == total_cost
    end

    test "returns map with equal values for each of it's three keys with three emails", %{
      purchase_list: purchase_list,
      total_cost: total_cost
    } do
      emails = ["emaila@amail.com", "emailb@bmail.com", "emailc@cmail.com"]
      assert {:ok, divided_costs} = Divisor.cost_by_email(purchase_list, emails)
      assert length(Map.keys(divided_costs)) == 3

      assert %{
               "emaila@amail.com" => cost_a,
               "emailb@bmail.com" => cost_b,
               "emailc@cmail.com" => cost_c
             } = divided_costs

      assert cost_a == cost_b
      assert cost_b == cost_c
      assert cost_a + cost_b + cost_c == total_cost
    end
  end
end
