require 'faker'

poro = User.create(name: "Poro")
fluffy = User.create(name: "Fluffy")
whiskers = User.create(name: "Whiskers")
parrot = User.create(name: "Party Parrot")
maizie = User.create(name: "Maizie")
gilly = User.create(name: "Gilly T. Dog")

monster = User.create(name: "Monster")
sloth = User.create(name: "Staging Sloth")

# Monster manages a few critters, but reports to the Sloth

poro.manager = monster
fluffy.manager = monster
whiskers.manager = monster

monster.manager = sloth

# Non-standard many-to-many relationships

# Item has a `seller` and `broker` - both users
5.times do
  Item.create(
    description: Faker::Hipster.sentence(4),
    seller: gilly,
    broker: [gilly, monster].sample
  )
end

30.times do
  PurchasedItem.create(
    buyer: [monster, parrot, gilly, whiskers, sloth].sample,
    item: Item.all.sample
  )
end
