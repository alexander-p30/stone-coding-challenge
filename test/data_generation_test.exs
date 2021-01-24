defmodule StoneChallenge.DataGenerationTest do
  use ExUnit.Case

  alias StoneChallenge.DataGeneration
  alias StoneChallenge.CostManaging.PurchaseItem

  describe "email_list" do
    setup do
      %{
        emails_list: DataGeneration.list(:email),
        purchase_list: DataGeneration.list(:purchase_item)
      }
    end

    test "returns a non-empty list of correct type", %{
      emails_list: emails_list,
      purchase_list: purchase_list
    } do
      assert is_list(emails_list)
      assert length(emails_list) > 0
      assert Enum.all?(emails_list, &is_binary(&1))
      assert is_list(purchase_list)
      assert length(purchase_list) > 0
      assert Enum.all?(purchase_list, &match?(%PurchaseItem{}, &1))
    end

    test "returns a list of n email strings when n is provided" do
      assert length(DataGeneration.list(:email, 13)) == 13
    end

    test "returns a list of n PurchaseItem structs when n is provided" do
      assert length(DataGeneration.list(:purchase_item, 25)) == 25
    end
  end
end
