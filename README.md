# StoneChallenge

Candidato: Estevan Alexander de Paula

E-mail: alexanderp30e@gmail.com

---

## Documentação

Documentação técnica do projeto pode ser acessada em [doc/index.html](./doc/index.html).

---

## Como utilizar?

Segue abaixo uma breve descrição de como utilizar a aplicação. Para maiores detalhes, por favor, acesse a [documentação](./doc/index.html) do projeto.

### Gerando os dados necessários

O módulo `StoneChallenge.DataGeneration` fornece uma interface para geração de dados aleatórios para teste através das funções `email_list/1` e `purchase_list/1`. Ambas as funções recebem um argumento opcional que determina a quantidade de dados a serem gerados. Caso esse argumento não seja fornecido, um número aleatório e limitado será utilizado no lugar.

```
iex> StoneChallenge.DataGeneration.email_list(2)
["estevan1@amail.com", "vinicius2@bmail.com"]
```

```
iex> StoneChallenge.DataGeneration.email_list()
["estevan1@amail.com", "vinicius2@bmail.com", "clara3@cmail.com", ...]
```

```
iex> StoneChallenge.DataGeneration.purchase_list()
[
  %StoneChallenge.CostManaging.PurchaseItem{
    name: "Mango",
    quantity: 2,
    unit_price_in_cents: 50
  },
  %StoneChallenge.CostManaging.PurchaseItem{
    name: "Banana",
    quantity: 2,
    unit_price_in_cents: 360
  },
  %StoneChallenge.CostManaging.PurchaseItem{
    name: "Pineapple",
    quantity: 5,
    unit_price_in_cents: 3900
  }
]
```

### Testando

A aplicação pode ser testada de forma manual ou através dos testes automatizados.

- Para testar manualmente, basta rodar `mix deps.get` seguido de `iex -S mix` no terminal estando na pasta raíz do projeto. A partir daí, pode-se tomar proveito do módulo auxiliar `StoneChallenge.DataGeneration` e das suas funções supracitadas. Gerados os dados, basta fornecer como primeiro argumento uma lista de structs do tipo `%StoneChallenge.CostManaging.PurchaseItem{}` (com `name`, `quantity` e `unit_price_in_cents`) e uma lista de strings como segundo argumento para a função `StoneChallenge.CostManaging.divide_costs_among_emails/2`.
- Os testes automatizados contam com 100% de cobertura e podem ser executados digitando `mix test` no terminal estando na pasta raíz do projeto. A opção `--cover` pode ser adicionada para que seja gerado um relatório de cobertura dos testes.

---

## Como funciona?

Utilizando a struct %StoneChallenge.CostManaging.ProductItem{}, o preço total da lista de compras é calculado multiplicando o preço de cada item pela sua quantidade. A struct conta com as chaves obrigatórias `name`, `quantity` e `unit_price_in_cents`. Calculado o preço total, calcula-se a divisão inteira desse total pelo número N de emails fornecidos. Se o resultado dessa divisão multiplicado por N for diferente do preço total calculado, cada unidade da diferença é distribuída em uma lista com N elementos iguais ao resultado da divisão inteira.

```
iex> purchase_list = [StoneChallenge.CostManaging.create_purchase_item(%{name: "Mango", quantity: 1, unit_price_in_cents: 100})]
[
  ok: %StoneChallenge.CostManaging.PurchaseItem{
    name: "Mango",
    quantity: 1,
    unit_price_in_cents: 100
  }
]
iex> emails = ["a@mail.com", "b@mail.com", "c@mail.com"]
["a@mail.com", "b@mail.com", "c@mail.com"]
iex> StoneChallenge.CostManaging.divide_costs_among_emails(purchase_list, emails)
{:ok, %{"a@mail.com" => 34, "b@mail.com" => 33, "c@mail.com" => 33}}
```
