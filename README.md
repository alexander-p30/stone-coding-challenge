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

O módulo `StoneChallenge.DataGeneration` fornece uma interface para geração de listas dados para teste através da função `list/2`.Essa função pode receber como primeiro parâmetro os atoms :email ou :purchase_item, que definem o tipo dos elementos da lista, e como segundo argumento um inteiro que define a quantidade de elementos da lista. Caso a quantidade não seja fornecida, será gerado um número aleatório de 1 a 10.

```
iex> StoneChallenge.DataGeneration.list(:email, 2)
["estevan1@amail.com", "vinicius2@bmail.com"]
```

```
iex> StoneChallenge.DataGeneration.list(:email)
["estevan1@amail.com", "vinicius2@bmail.com", "clara3@cmail.com", ...]
```

```
iex> StoneChallenge.DataGeneration.list(:purchase_item)
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

- Para testar manualmente, basta rodar `iex -S mix` no terminal estando na pasta raíz do projeto. A partir daí, pode-se tomar proveito do módulo auxiliar `StoneChallenge.DataGeneration` e da sua função supracitada. Gerados os dados, a função `StoneChallenge.CostManaging.divide_costs_among_emails/2` é utilizada para dividir o custo entre os emails. Para tal, é necessário como primeiro parâmetro uma lista de structs do tipo `%StoneChallenge.CostManaging.PurchaseItem{}` (com `name`, `quantity` e `unit_price_in_cents`) e como segundo parâmetro uma lista de strings. Para maiores especificações, consulte a [documentação](doc/index.html). [Exemplos de utilização](#exemplos).
- Os testes automatizados contam com 100% de cobertura e podem ser executados digitando `mix test` no terminal estando na pasta raíz do projeto. A opção `--cover` pode ser adicionada para que seja gerado um relatório de cobertura dos testes.

---

## Como funciona?

Utilizando a struct %StoneChallenge.CostManaging.ProductItem{}, o preço total da lista de compras é calculado multiplicando o preço de cada item pela sua quantidade. A struct conta com as chaves obrigatórias `name`, `quantity` e `unit_price_in_cents`. Calculado o preço total, calcula-se a divisão inteira desse total pelo número N de emails fornecidos, cujo resultado chamaremos de R. A partir daí:

- Se R \* N for igual ao preço total calculado, temos uma lista com N elementos com o valor de R.
- Se R \* N for diferente do preço total calculado, cada unidade da diferença é distribuída em uma lista com N elementos iguais de valor R, normalizando a distribuição. Dessa forma, após a distribuição, alguns elementos são maiores que outros e ao somar todos os elementos da lista, obtemos o preço total calculado.

Com a lista montada e normalizada, montamos um Map iterando-a e buscando os elementos da lista de emails que estão na mesma posição da iteração para montar os pares email => custo_dividido, o que nos dá o resultado final.

---

## Exemplos

### Exemplo 1 (100 dividido por 3 emails)

```
iex> purchase_list = [%{name: "Mango", quantity: 1, unit_price_in_cents: 100} |> StoneChallenge.CostManaging.create_purchase_item() |> elem(1)]
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

### Exemplo 2 (101 dividido por 3 emails)

```
iex> purchase_list = [%{name: "Mango", quantity: 1, unit_price_in_cents: 101} |> StoneChallenge.CostManaging.create_purchase_item() |> elem(1)]
[
  ok: %StoneChallenge.CostManaging.PurchaseItem{
    name: "Mango",
    quantity: 1,
    unit_price_in_cents: 101
  }
]
iex> emails = ["a@mail.com", "b@mail.com", "c@mail.com"]
iex> StoneChallenge.CostManaging.divide_costs_among_emails(purchase_list, emails)
{:ok, %{"a@mail.com" => 34, "b@mail.com" => 34, "c@mail.com" => 33}}
```

### Exemplo 3 (102 dividido por 3 emails)

```
iex> purchase_list = [%{name: "Mango", quantity: 1, unit_price_in_cents: 102} |> StoneChallenge.CostManaging.create_purchase_item() |> elem(1)]
[
  ok: %StoneChallenge.CostManaging.PurchaseItem{
    name: "Mango",
    quantity: 1,
    unit_price_in_cents: 102
  }
]
iex> emails = ["a@mail.com", "b@mail.com", "c@mail.com"]
iex> StoneChallenge.CostManaging.divide_costs_among_emails(purchase_list, emails)
{:ok, %{"a@mail.com" => 34, "b@mail.com" => 34, "c@mail.com" => 34}}
```
