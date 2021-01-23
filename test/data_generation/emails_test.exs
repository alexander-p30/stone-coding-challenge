defmodule StoneChallenge.DataGeneration.EmailsTest do
  use ExUnit.Case

  alias StoneChallenge.DataGeneration.Emails

  describe "generate_name" do
    setup do
      %{name: Emails.generate_name()}
    end

    test "returns a non-empty string", %{name: generated_name} do
      assert is_binary(generated_name)
      assert String.length(generated_name) > 0
    end
  end

  describe "generate_domain" do
    setup do
      %{domain: Emails.generate_domain()}
    end

    test "returns a non-empty string", %{domain: generated_domain} do
      assert is_binary(generated_domain)
      assert String.length(generated_domain) > 0
    end

    test "returns a string in the @domain.com format", %{domain: generated_domain} do
      assert "@" <> domain_name = generated_domain
      assert String.ends_with?(domain_name, ".com")
      assert String.length(domain_name) > String.length(".com")
    end
  end
end
