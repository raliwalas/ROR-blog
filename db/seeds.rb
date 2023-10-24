# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# find or create the account with this email address
# remade my account in console - not sure if this 100% works where it creates account
#  if not found
# fixme for later
user = User.where(email: "rachel.aliwalas52@gmail.com").first_or_initialize

#! allows us to run and rerun without errors
user.update!(
    password: "password",
    password_confirmation: "password"
)