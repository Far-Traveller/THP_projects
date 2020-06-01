User.destroy_all # Remise à 0
City.destroy_all # Remise à 0
Gossip.destroy_all # Remise à 0
Tag.destroy_all # Remise à 0
GossipTag.destroy_all # Remise à 0
PrivateMessage.destroy_all # Remise à 0

# Création de 10 villes aléatoires avec des zip_code aléatoires
10.times do 
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
    )
end

# Je définis 10 users aléatoirement et je lui affecte une des 10 villes créées
10.times do
  User.create(
    first_name: Faker::Superhero.prefix,
    last_name: Faker::Superhero.suffix,
    description: Faker::TvShows::Simpsons.quote,
    email: Faker::Internet.email,
    age: Faker::Number.within(range: 15..50),
    city: City.all[rand(0..9)]
    )
end

#Je crée un anonymous pour la création d'un nouveau potin (nécessaire pour la V2 du pojet gossip)
User.create(
first_name: "anonymous",
last_name: Faker::Superhero.suffix,
description: Faker::TvShows::Simpsons.quote,
email: Faker::Internet.email,
age: Faker::Number.within(range: 15..50),
city: City.all[rand(0..9)]
)
puts "j'ai créé l'user anonymous"

# Création de 20 gossips. Chaque gossip est attribué aléatoirement à un des users (un user peut ne pas avoir de gossip)
20.times do 
  Gossip.create(
    title: Faker::Movies::HarryPotter.spell.slice(0..14),
    content: Faker::Quote.yoda,
    user: User.all[rand(0..9)]
    )
end

# Création de 10 tags aléatoires
10.times do 
  Tag.create(title: Faker::Beer.brand
  )
end

# Chaque gossip a aléatoirement 2 tags
Gossip.all.each do |gossip| 
  GossipTag.create(gossip: gossip, tag: Tag.all[rand(0..9)])
  GossipTag.create(gossip: gossip, tag: Tag.all[rand(0..9)])
end

# We create 10 messages that will be sent by 1 person and received by someone random. One person can receive several messages
10.times do 
  pm = PrivateMessage.create(
    content: Faker::TvShows::DrWho.quote,
    sender: User.all[rand(0..9)],
    recipient: User.all[rand(0..9)]
    )
end

puts "Seed fini !!"