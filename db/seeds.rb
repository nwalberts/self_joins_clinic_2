require 'faker'

dwight = User.create(name: "Dwight")
stanley = User.create(name: "Stanley")
pam = User.create(name: "Pam")
jim = User.create(name: "Jim")
andy = User.create(name: "Andy")
kelly = User.create(name: "Kelly")

michael = User.create(name: "Michael")
jan = User.create(name: "Jan")

# Monster manages a few critters, but reports to the Sloth

dwight.manager = michael
stanley.manager = michael
pam.manager = michael

michael.manager = jan

# Non-standard many-to-many relationships

Item.create(
  description: "Here-Comes-Treble-brand bow-tie",
  seller: andy,
  broker: andy
)

# Item has a `seller` and `broker` - both users
5.times do
  Item.create(
    description: Faker::Hipster.sentence(4),
    seller: kelly,
    broker: [kelly, michael].sample
  )
end

30.times do
  PurchasedItem.create(
    buyer: [michael, jim, kelly, pam, jan].sample,
    item: Item.all.sample
  )
end
