# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClinicalCenterAdmin.create!([
  {email: "admin@user.com", password: 'password', password_confirmation: 'password'}
])

Address.create!([
  {street: "Lars Family Hoamstead", city: "Tozeur", country: "Tunesia"},
  {street: "Thone room B", city: "Imperial Palace", country: "Alderaan"}
])

Patient.create!([
  {email: "patient1@user.com", jmbg: "1234567890", first_name: "Luke", last_name: "Skywalker", phone_number: "5550128", password: 'password', password_confirmation: 'password', address: Address.first},
  {email: "patient2@user.com", jmbg: "1234567891", first_name: "Leia", last_name: "Organa", phone_number: "567885546", password: 'password', password_confirmation: 'password', address: Address.second}
])

Doctor.create!([
  {email: "doctor1@email.com", first_name: "Padme", last_name: "Amidala"},
  {email: "doctor2@email.com", first_name: "Mace", last_name: "Windu"},
  {email: "doctor3@email.com", first_name: "Qui-Gon", last_name: "Jinn"},
  {email: "doctor4@email.com", first_name: "Jar Jar", last_name: "Binks"}
])
