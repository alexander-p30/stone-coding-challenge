defmodule StoneChallenge.CostManaging.Divisor do
  @moduledoc """
  Provides functions to divide list of ProductItems costs among a list of emails.
  """

  @spec cost_by_email([StoneChallenge.CostManaging.PurchaseItem.t()], [String.t()]) ::
          {:error, String.t()} | {:ok, %{String.t() => integer()}}
  def cost_by_email(purchase_list, emails) when not (is_list(purchase_list) and is_list(emails)),
    do: raise(ArgumentError, "Both arguments must be lists.")

  def cost_by_email(_purchase_list, []), do: {:error, "Cant divide price among 0 emails."}
  def cost_by_email([], emails), do: {:ok, Enum.map(emails, &{&1, 0}) |> Enum.into(%{})}

  def cost_by_email(purchase_list, emails) do
    if Enum.uniq(emails) == emails do
      {:ok, purchase_list |> total_cost() |> divide_costs(emails)}
    else
      {:error,
       "There are repeated emails in the list. Please make sure each email in the list is unique."}
    end
  end

  defp total_cost(purchase_list),
    do:
      Enum.reduce(purchase_list, 0, fn item, acc ->
        item.unit_price_in_cents * item.quantity + acc
      end)

  defp divide_costs(total_cost, emails) do
    email_quantity = length(emails)

    total_cost
    |> div(email_quantity)
    |> normalize_cost(email_quantity, total_cost)
    |> Enum.with_index(0)
    |> Enum.map(fn {cost, index} -> {Enum.at(emails, index), cost} end)
    |> Enum.into(%{})
  end

  defp normalize_cost(divided_cost, divisor, total_cost)
       when total_cost - divided_cost * divisor == 0,
       do: List.duplicate(divided_cost, divisor)

  defp normalize_cost(divided_cost, divisor, total_cost) do
    total_cost_diff = total_cost - divided_cost * divisor

    divided_cost
    |> List.duplicate(divisor)
    |> Enum.with_index(1)
    |> Enum.map(fn {cost, index} -> if index <= total_cost_diff, do: cost + 1, else: cost end)
  end
end
