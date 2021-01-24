defmodule StoneChallenge.DataGeneration.ListsTest do
  use ExUnit.Case

  alias StoneChallenge.DataGeneration.Lists
  alias StoneChallenge.CostManaging.PurchaseItem

  describe "type" do
    setup do
      %{email_list: Lists.type(:email, 5), purchase_list: Lists.type(:purchase_item, 5)}
    end

    test "raises exception when provided ammount is not int" do
      assert_raise ArgumentError, fn -> Lists.type(:email, 1.0) end
      assert_raise ArgumentError, fn -> Lists.type(:purchase_item, 1.0) end
    end

    test "raises exception when provided ammount is integer lower than 1" do
      assert_raise ArgumentError, fn -> Lists.type(:email, 0) end
      assert_raise ArgumentError, fn -> Lists.type(:purchase_item, 0) end
    end

    test "returns a non-empty list", %{email_list: email_list, purchase_list: purchase_list} do
      assert is_list(email_list)
      assert length(email_list) > 0
      assert is_list(purchase_list)
      assert length(purchase_list) > 0
    end

    test "returns a list of strings when generating email lists", %{email_list: email_list} do
      assert Enum.all?(email_list, &is_binary(&1))
    end

    test "returns a list of PurchaseItem type structs when generating purchase item", %{
      purchase_list: purchase_list
    } do
      assert Enum.all?(purchase_list, &match?(%PurchaseItem{}, &1))
    end
  end
end
