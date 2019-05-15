# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Villain.destroy_all
Franchise.destroy_all
Adventure.destroy_all

batman = User.create(first_name: "Bat", last_name: "man", email:"thebat@gotham.com", abilities: "cool gadgets, money", catchphrase: "I am the hero Gotham needs")
superman = User.create(first_name: "Super", last_name: "man", email:"S@metro.com", abilities: "strength, flight, charming", catchphrase: "I love Lois Lane")
hanna = User.create(first_name: "Hannah", last_name: "of Necrius", email:"rockabilly@magic.com", abilities: "arcane magic", catchphrase: "I was just tired, what can I say?")
thor = User.create(first_name: "Thor", last_name: "God of Thunder", email:"thunder@asgaard.com", abilities: "strength, flight, hammer, thunder, lightening", catchphrase: "Do we have more ale?")

loki = Villain.create(name: "Loki", abilities: "trickery, magic", catchphrase: "I should be king of Asgaard")
joker = Villain.create(name: "Joker", abilities: "insane, bombs", catchphrase: "Hello Bats")
nrygoth = Villain.create(name: "N’Rygoth", abilities: "interdimensional lovecraftian god", catchphrase: "I have many followers")
thanos = Villain.create(name: "Thanos", abilities: "strength, army, infinity stones", catchphrase: "*snaps*")

Franchise.create(name: "Marvel Cinematic Universe", company: "Marvel Studios")
Franchise.create(name: "DC Extended Universe", company: "Warner Bros. Pictures")
Franchise.create(name: "Rat Queens", company: "Darkhorse Comics")

Adventure.create(name: "Endgame", location: "the Universe", franchise: Franchise.first, villain: Villain.fourth, hero: Hero.fourth)
Adventure.create(name: "The Killing Joke", location: "Gotham", franchise: Franchise.second, villain: Villain.second, hero: Hero.first)
Adventure.create(name: "Smallville", location: "Metropolis", franchise: Franchise.second, villain: Villain.first, hero: Hero.second)
Adventure.create(name: "Sass & Sorcery", location:"medieval realm", franchise: Franchise.third, villain: Villain.third, hero: Hero.third)



