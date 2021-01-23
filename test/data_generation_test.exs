defmodule StoneChallenge.DataGenerationTest do
  use ExUnit.Case

  alias StoneChallenge.DataGeneration
  alias StoneChallenge.CostManaging.PurchaseItem

  describe "email_list" do
    setup do
      %{emails_list: DataGeneration.email_list()}
    end

    test "returns a non-empty list of email strings", %{emails_list: generated_list} do
      assert is_list(generated_list)
      assert length(generated_list) > 0
      assert Enum.all?(generated_list, &is_binary(&1))
    end

    test "returns a list of n email strings when n is provided" do
      assert length(DataGeneration.email_list(13)) == 13
    end
  end

  describe "purchase_list" do
    setup do
      %{purchase_list: DataGeneration.purchase_list()}
    end

    test "returns a non-empty list of PurchaseItem structs", %{purchase_list: generated_list} do
      assert is_list(generated_list)
      assert length(generated_list) > 0
      assert Enum.all?(generated_list, &match?(%PurchaseItem{}, &1))
    end

    test "returns a list of n PurchaseItem structs when n is provided" do
      assert length(DataGeneration.email_list(25)) == 25
    end
  end
end
