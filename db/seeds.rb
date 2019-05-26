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

batman = User.create(first_name: "Bruce", last_name: "Wayne", nickname: "Batman", email:"thebat@gotham.com", password:"batman", password_confirmation:"batman", abilities: "cool gadgets, money", catchphrase: "I am the hero Gotham needs")
superman = User.create(first_name: "Clark", last_name: "Kent", nickname: "Superman", email:"S@metro.com", password:"superman", password_confirmation:"superman", abilities: "strength, flight, charming", catchphrase: "I love Lois Lane")
hannah = User.create(first_name: "Hannah", last_name: "of Necrius", nickname: "Hannah the Mage", email:"rockabilly@magic.com", password:"hannah", password_confirmation:"hannah", abilities: "arcane magic", catchphrase: "I was just tired, what can I say?")
thor = User.create(first_name: "Thor", last_name: "God of Thunder", nickname: "Thor", email:"thunder@asgaard.com", password:"thor", password_confirmation:"thor", abilities: "strength, flight, hammer, thunder, lightening", catchphrase: "Do we have more ale?")
harry = User.create(first_name: "Harry", last_name: "Potter", nickname: "Harry Potter", email:"harry@hogwarts.com", password:"potter", password_confirmation:"potter", abilities: "good magic, quick on a broom, friendship, love", catchphrase: "Malfoy, I'll knock you off your broom!")

loki = Villain.create(name: "Loki", abilities: "trickery, magic", catchphrase: "I should be king of Asgaard")
joker = Villain.create(name: "Joker", abilities: "insane, bombs", catchphrase: "Hello Bats")
nrygoth = Villain.create(name: "N’Rygoth", abilities: "interdimensional lovecraftian god", catchphrase: "I have many followers")
thanos = Villain.create(name: "Thanos", abilities: "strength, army, infinity stones", catchphrase: "*snaps*")
voldemort = Villain.create(name: "Voldemort", abilities: "charismatic, dark wizardry", catchphrase: "I will get you, Harry Potter.")

Franchise.create(name: "Marvel Cinematic Universe", company: "Marvel Studios")
Franchise.create(name: "DC Extended Universe", company: "Warner Bros. Pictures")
Franchise.create(name: "Rat Queens", company: "Darkhorse Comics")
Franchise.create(name: "Lord of the Rings", company: "Middle-earth Enterprises")
Franchise.create(name:"Star Trek", company: "Viacom")
Franchise.create(name: "Star Wars", company: "Disney")
Franchise.create(name: "Harry Potter", company: "Time Warner Inc.")
Franchise.create(name: "Twilight", company: "Summit Entertainment")




Adventure.create(name: "Endgame", location: "the Universe", franchise: Franchise.first, villain: Villain.fourth, user: User.fourth, description: "Thanos plots to rid the universe of half of all living beings!")
Adventure.create(name: "The Killing Joke", location: "Gotham City", franchise: Franchise.second, villain: Villain.second, user: User.first, description: "Joker attacks Gotham City in a historically sinister way.")
Adventure.create(name: "Smallville", location: "Metropolis", franchise: Franchise.second, villain: Villain.first, user: User.second, description: "Lex Luthor's corporation plants seeds of corruption in Metropolis.")
Adventure.create(name: "The Far Reaching Tentacles of N’Rygoth", location:"Medieval Realm", franchise: Franchise.third, villain: Villain.third, user: User.third, description: "Rat Queens try to prevent a vengeful businessman from summoning Dee's people's many-tentacled gods to lay waste to Palisade.")



