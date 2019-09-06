# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

SnackMachine.destroy_all
Snack.destroy_all
Machine.destroy_all
Owner.destroy_all

owner = Owner.create(name: "Jen")
machine_1 = Machine.create(location: "Don's Mixed Drinks")
machine_2 = Machine.create(location: "Turing Basement")

owner.machines << machine_1
owner.machines << machine_2

snack_1 = Snack.create(name: "White Castle Burger", price: 3.50)
snack_2 = Snack.create(name: "Pop Rocks", price: 1.50)
snack_3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)

machine_1.snacks << snack_1
machine_1.snacks << snack_2
machine_2.snacks << snack_1
machine_2.snacks << snack_3
