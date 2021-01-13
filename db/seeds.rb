# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipe = Recipe.new({ title: "Raw eggs!!!", chef: "Jay Wengrow", ingredients: "One live chicken", directions: "Squeeze the chicken" })
recipe.save

recipe = Recipe.new(title: "Empty sandwich", chef: "Jay Wengrow", ingredients: "Two slices of bread", directions: "Put one slice of bread on top of the other")
recipe.save

recipe = Recipe.new(title: "Ice cubes", chef: "Peter Jang", ingredients: "Water", directions: "Place water in freezer.")
recipe.save
