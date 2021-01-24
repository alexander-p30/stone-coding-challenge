searchNodes=[{"doc":"Holds the domain types and business logic.","ref":"StoneChallenge.html","title":"StoneChallenge","type":"module"},{"doc":"Interface for interacting with cost managing modules.","ref":"StoneChallenge.CostManaging.html","title":"StoneChallenge.CostManaging","type":"module"},{"doc":"Returns a struct of StoneChallenge.CostManaging.PurchaseItem type.Parametersattrs: map with name as string, quantity as integer and unit_price_in_cents as integer.","ref":"StoneChallenge.CostManaging.html#create_purchase_item/1","title":"StoneChallenge.CostManaging.create_purchase_item/1","type":"function"},{"doc":"Returns a map of String =&gt; integer structure, representing the divided price to be paid by each 'email'.Parameterspurchase_list: list of StoneChallenge.CostManaging.PurchaseItem structsemails_list: list of strings","ref":"StoneChallenge.CostManaging.html#divide_costs_among_emails/2","title":"StoneChallenge.CostManaging.divide_costs_among_emails/2","type":"function"},{"doc":"Interface for interacting with data generating modules.","ref":"StoneChallenge.DataGeneration.html","title":"StoneChallenge.DataGeneration","type":"module"},{"doc":"Returns a list of specified type.Parameterstype: atom representing type of list to be generated.ammount: integer representing the ammount of elements of specified type in the generated list.","ref":"StoneChallenge.DataGeneration.html#list/2","title":"StoneChallenge.DataGeneration.list/2","type":"function"},{"doc":"Provides functions to divide list of ProductItems costs among a list of emails.","ref":"StoneChallenge.CostManaging.Divisor.html","title":"StoneChallenge.CostManaging.Divisor","type":"module"},{"doc":"","ref":"StoneChallenge.CostManaging.Divisor.html#cost_by_email/2","title":"StoneChallenge.CostManaging.Divisor.cost_by_email/2","type":"function"},{"doc":"Provides a type for purchase list items.","ref":"StoneChallenge.CostManaging.PurchaseItem.html","title":"StoneChallenge.CostManaging.PurchaseItem","type":"module"},{"doc":"Returns a list of strings representing the necessary keys for creating structs of StoneChallenge.CostManaging.PurchaseItem type.","ref":"StoneChallenge.CostManaging.PurchaseItem.html#necessary_keys/0","title":"StoneChallenge.CostManaging.PurchaseItem.necessary_keys/0","type":"function"},{"doc":"Type that represents ProductItem structs with name as string, quantity as integer and unit_price_in_cents as integer.","ref":"StoneChallenge.CostManaging.PurchaseItem.html#t:t/0","title":"StoneChallenge.CostManaging.PurchaseItem.t/0","type":"type"},{"doc":"Provides functions for email string generation.","ref":"StoneChallenge.DataGeneration.Emails.html","title":"StoneChallenge.DataGeneration.Emails","type":"module"},{"doc":"Returns a random string representing an email domain.Examples iex&gt; StoneChallenge.DataGeneration.Emails.generate_domain() &quot;@dmail.com&quot;","ref":"StoneChallenge.DataGeneration.Emails.html#generate_domain/0","title":"StoneChallenge.DataGeneration.Emails.generate_domain/0","type":"function"},{"doc":"Returns a random string representing an email name.Example iex&gt; StoneChallenge.DataGeneration.Emails.generate_name() &quot;estevan&quot;","ref":"StoneChallenge.DataGeneration.Emails.html#generate_name/0","title":"StoneChallenge.DataGeneration.Emails.generate_name/0","type":"function"},{"doc":"Provides functions for lists of unique email strings or PurchaseItem structs.","ref":"StoneChallenge.DataGeneration.Lists.html","title":"StoneChallenge.DataGeneration.Lists","type":"module"},{"doc":"Generates a list of specified type.Parameterstype: atom representing desired type of list elements.ammount: integer with number of elements of specified type in list.Examples iex&gt; StoneChallenge.DataGeneration.Lists.type(:email, 2) [&quot;estevan1@amail.com&quot;, &quot;vinicius2@bmail.com&quot;] iex&gt; StoneChallenge.DataGeneration.Lists.type(:purchase_item, 3) [ %StoneChallenge.CostManaging.PurchaseItem{ name: &quot;Mango&quot;, quantity: 2, unit_price_in_cents: 50 }, %StoneChallenge.CostManaging.PurchaseItem{ name: &quot;Banana&quot;, quantity: 2, unit_price_in_cents: 360 }, %StoneChallenge.CostManaging.PurchaseItem{ name: &quot;Pineapple&quot;, quantity: 5, unit_price_in_cents: 3900 } ]","ref":"StoneChallenge.DataGeneration.Lists.html#type/2","title":"StoneChallenge.DataGeneration.Lists.type/2","type":"function"},{"doc":"Provides function for ProductItem struct generation.","ref":"StoneChallenge.DataGeneration.PurchaseItems.html","title":"StoneChallenge.DataGeneration.PurchaseItems","type":"module"},{"doc":"Returns a struct of StoneChallenge.CostManaging.PurchaseItem type.Example iex&gt; StoneChallenge.DataGeneration.PurchaseItems.generate() %StoneChallenge.CostManaging.PurchaseItem{name: &quot;Mango&quot;, quantity: 4, unit_price_in_cents: 650}","ref":"StoneChallenge.DataGeneration.PurchaseItems.html#generate/0","title":"StoneChallenge.DataGeneration.PurchaseItems.generate/0","type":"function"}]