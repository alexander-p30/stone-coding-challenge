defmodule StoneChallenge.DataGeneration.ListsTest do
  use ExUnit.Case

  alias StoneChallenge.DataGeneration.Lists
  alias StoneChallenge.CostManaging.PurchaseItem

  describe "emails" do
    setup do
      %{email_list: Lists.emails(5)}
    end

    test "raises exception when provided argument is not int" do
      assert_raise ArgumentError, fn -> Lists.emails(1.0) end
    end

    test "raises exception when provided argument is integer lower than 1" do
      assert_raise ArgumentError, fn -> Lists.emails(0) end
    end

    test "returns a non-empty list", %{email_list: generated_list} do
      assert is_list(generated_list)
      assert length(generated_list) > 0
    end

    test "returns a list of strings", %{email_list: generated_list} do
      assert Enum.all?(generated_list, &is_binary(&1))
    end
  end

  describe "purchase" do
    setup do
      %{purchase_list: Lists.purchase(10)}
    end

    test "raises exception when provided argument is not int" do
      assert_raise ArgumentError, fn -> Lists.purchase(1.0) end
    end

    test "raises exception when provided argument is integer lower than 1" do
      assert_raise ArgumentError, fn -> Lists.purchase(0) end
    end

    test "returns a non-empty list", %{purchase_list: generated_list} do
      assert is_list(generated_list)
      assert length(generated_list) > 0
    end

    test "returns a list of PurchaseItem type structs", %{purchase_list: generated_list} do
      assert Enum.all?(generated_list, &match?(%PurchaseItem{}, &1))
    end
  end
end
