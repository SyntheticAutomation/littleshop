require 'faker'

#users
# Item.destroy_all
# User.destroy_all
# Order.destroy_all

  #default users
  user_1 = User.create(name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: Faker::Address.zip.to_i, email: "everythingisfine@gmail.com", password: Faker::Internet.password(7))
  user_2 = User.create(name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: Faker::Address.zip.to_i, email: "no_tolerance@gmail.com", password: Faker::Internet.password(7))

  #merchants
  user_3 = User.create(name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: Faker::Address.zip.to_i, email: "salesman@nixon.com", password: Faker::Internet.password(7), role: 1)
  user_4 = User.create(name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: Faker::Address.zip.to_i, email: "merchant@blockbuster.com", password: Faker::Internet.password(7), role: 1)
  user_5 = User.create(name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: Faker::Address.zip.to_i, email: "shipping@barefootwines.com", password: Faker::Internet.password(7), role: 1)

  #admins
  user_6 = User.create(name: Faker::Name.name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zipcode: Faker::Address.zip.to_i, email: "admin@admin.com", password: Faker::Internet.password(7), role: 2)

  #items
  item_1 = user_3.items.create(name: "Amaretto Sour", description: "a sweet nutty cocktail that calls for a full bodied spirit to pair with the bright citrus and sugar. di Amore Amaretto is an excellent choice with its rich body and caramel, almond flavors.", image_url: "https://bit.ly/2BoIMFi", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_2 = user_3.items.create(name: "Espresso Martini", description: "a cold, coffee-flavored cocktail made with vodka, espresso coffee, coffee liqueur, and sugar syrup.", image_url: "https://bit.ly/2A4XQYS", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_3 = user_4.items.create(name: "Manhattan", description: "a cocktail made with whiskey, sweet vermouth and bitters. While rye is the traditional whiskey of choice, other commonly used whiskeys include Canadian whisky, bourbon, blended whiskey and Tennessee whiskey.", image_url: "https://bit.ly/2S5enTr", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_4 = user_4.items.create(name: "Old Fashioned", description: "a cocktail made by muddling sugar with bitters, then adding alcohol, originally whiskey but now sometimes brandy and finally a twist of citrus rind. It is traditionally served in a short, round, tumbler-like glass, which is called an Old Fashioned glass, after the drink.", image_url: "https://bit.ly/2EC04Tc", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_5 = user_4.items.create(name: "Dry Martini", description: "made with gin and vermouth, this drink is garnished with an olive or a lemon twist. Over the years, the martini has become one of the best-known mixed alcoholic beverages. H. L. Mencken called the martini 'the only American invention as perfect as the sonnet.'", image_url: "https://bit.ly/2A4b8ER", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_6 = user_4.items.create(name: "Daiquiri", description: "a family of cocktails whose main ingredients are rum, citrus juice, and sugar or other sweetener. The daiquiri is one of the six basic drinks listed in David A. Embury's classic The Fine Art of Mixing Drinks, which also lists some variations.", image_url: "https://bit.ly/2EC0kl8", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_7 = user_4.items.create(name: "Mai Tai", description: "a cocktail based on rum, Curaçao liqueur, orgeat syrup, and lime juice, associated with Polynesian-style settings.", image_url: "https://bit.ly/2A6Ehzc", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_8 = user_4.items.create(name: "Aviation", description: "a classic cocktail made with gin, maraschino liqueur, crème de violette, and lemon juice. Some recipes omit the crème de violette. It is served straight up, in a cocktail glass.", image_url: "https://bit.ly/2CiGfOL", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_9 = user_4.items.create(name: "Snowball", description: "a mixture of Advocaat and lemonade in approximately equal parts. It may have other ingredients, to taste. It typically contains a squeeze of fresh lime juice, which is shaken with the advocaat before pouring into a glass and topping up with lemonade.", image_url: "https://bit.ly/2LoVyIu", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_10 = user_5.items.create(name: "Bloody Mary", description: "a cocktail containing vodka, tomato juice, and combinations of other spices and flavorings including Worcestershire sauce, hot sauces, garlic, herbs, horseradish, celery, olives, salt, black pepper, lemon juice, lime juice and/or celery salt.", image_url: "https://bit.ly/2S8MVUP", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_11 = user_5.items.create(name: "Cantaritos", description: "a juicy (freshly squeezed orange, grapefruit and lime) and refreshing slightly salty tequila invigorated with sparkling grapefruit soda. A cocktail commonly made in bars, cafés and even road side stalls of Jalisco, Mexico.", image_url: "https://bit.ly/2EqZCq5", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_12 = user_5.items.create(name: "South Side", description: "an electric cocktail made with gin, lime juice, simple syrup and mint.", image_url: "https://bit.ly/2PJI1vq", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_13 = user_5.items.create(name: "Cosmopolitan", description: "a cocktail made with vodka, triple sec, cranberry juice, and freshly squeezed organic lime juice.", image_url: "https://bit.ly/2A5kwrO", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_14 = user_5.items.create(name: "Mojito", description: "a traditional Cuban highball. Traditionally, a mojito is a cocktail that consists of five ingredients: white rum, sugar, lime juice, soda water, and mint. Its combination of sweetness, citrus, and mint flavors is intended to complement the rum, which has made the mojito a popular summer drink.", image_url: "https://bit.ly/2QzcCRM", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_15 = user_5.items.create(name: "Sidecar", description: "a cocktail traditionally made with cognac, orange liqueur, plus lemon juice. In its ingredients, the drink is perhaps most closely related to the older brandy crusta, which differs both in presentation and in proportions of its components.", image_url: "https://bit.ly/2A2RBF4", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_16 = user_5.items.create(name: "Long Island Iced Tea", description: "typically made with vodka, tequila, light rum, triple sec, gin, and a splash of cola, which gives the drink the same amber hue as its namesake.", image_url: "https://bit.ly/2EpUBOF", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_17 = user_5.items.create(name: "Whiskey Sour", description: "a mixed drink containing whiskey, lemon juice, sugar, and optionally, a dash of egg white.", image_url: "https://bit.ly/2EB9iiU", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_18 = user_5.items.create(name: "Moscow Mule", description: "a cocktail made with vodka, spicy ginger beer, and lime juice, garnished with a slice or wedge of lime and mint leaves.", image_url: "https://bit.ly/2rICjQZ", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_19 = user_5.items.create(name: "Tom Collins", description: "a cocktail made from gin, lemon juice, sugar, and carbonated water. First memorialized in writing in 1876 by Jerry Thomas, the 'father of American mixology', this drink is typically served in a Collins glass over ice. ", image_url: "https://bit.ly/2zZLkty", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))
  item_20 = user_5.items.create(name: "Gimlet", description: "a cocktail typically made of 2 part gin, 1 part lime juice, and soda. A 1928 description of the drink was: 'gin, a spot of lime, and soda'. The description in the 1953 Raymond Chandler novel The Long Goodbye stated that 'a real gimlet is half gin and half Rose's lime juice and nothing else'.", image_url: "https://bit.ly/2S6DFRb", inventory_qty: rand(1..9999), price: Faker::Number.decimal(2))

#orders
  order_1 = Order.create(status: 0)
  order_2 = Order.create(status: 1)
  order_3 = Order.create(status: 2)
  order_4 = Order.create(status: 3)
