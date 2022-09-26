# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "\nSeeting the Data...start"
 categories = Category.create([{ name: "Plots", code: 'PLOT111' }, { name: "Flats", code: 'FLAT222' }])
 
 puts "\nSeeting the Data..complete"
