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
  {street: "Thone room B", city: "Imperial Palace", country: "Alderaan"},
  {street: "Just", city: "Some", country: "Address"},
  {street: "1231  Fraggle Drive", city: "Louisville", country: "USA"},
  {street: "937  Fannie Street", city: "San Angelo", country: "USA"}
])

Patient.create!([
  {email: "patient1@user.com", jmbg: "1234567890", first_name: "Luke", last_name: "Skywalker", phone_number: "5550128", password: 'password', password_confirmation: 'password', address: Address.first, approved: true},
  {email: "patient2@user.com", jmbg: "1234567891", first_name: "Leia", last_name: "Organa", phone_number: "567885546", password: 'password', password_confirmation: 'password', address: Address.second},
  {email: "patient3@user.com", jmbg: "1234567892", first_name: "Obi Van", last_name: "Kenobi", phone_number: "567885543", password: 'password', password_confirmation: 'password', address: Address.third}
])

Doctor.create!([
  {email: "doctor1@user.com", first_name: "Padme", last_name: "Amidala"},
  {email: "doctor2@user.com", first_name: "Mace", last_name: "Windu"},
  {email: "doctor3@user.com", first_name: "Qui-Gon", last_name: "Jinn"},
  {email: "doctor4@user.com", first_name: "Jar Jar", last_name: "Binks"}
])

ExaminationType.create!([
  {kind: "operation"},
  {kind: "examination"}
])

DoctorExaminationType.create!([
  {doctor: Doctor.first, examination_type: ExaminationType.first},
  {doctor: Doctor.first, examination_type: ExaminationType.second},
  {doctor: Doctor.second, examination_type: ExaminationType.first},
  {doctor: Doctor.third, examination_type: ExaminationType.second},
  {doctor: Doctor.fourth, examination_type: ExaminationType.first}
])

Clinic.create!([
  {name: "SvetskiMegaCar", address: Address.third, description: "Svetska klinika mega cara"},
  {name: "3 kostura", address: Address.fourth, description: "Ko prezivi pricace"},
  {name: "3 kostura koja ne radi", address: Address.fourth, description: "Nema zivih vise"}
])

ClinicDoctor.create!([
  {clinic: Clinic.first, doctor: Doctor.first},
  {clinic: Clinic.second, doctor: Doctor.first},
  {clinic: Clinic.first, doctor: Doctor.second},
  {clinic: Clinic.second, doctor: Doctor.third},
  {clinic: Clinic.second, doctor: Doctor.fourth},
  {clinic: Clinic.third, doctor: Doctor.fourth}
])

Hall.create!([
  {clinic: Clinic.first, name: "Rambo"},
  {clinic: Clinic.second, name: "Menza"}
])

PriceList.create!([
  {clinic: Clinic.first},
  {clinic: Clinic.second}
])

PriceItem.create!([
  {price_list: PriceList.first, examination_type: ExaminationType.first, price: "100"},
  {price_list: PriceList.first, examination_type: ExaminationType.second, price: "10"},
  {price_list: PriceList.second, examination_type: ExaminationType.first, price: "10"},
  {price_list: PriceList.second, examination_type: ExaminationType.second, price: "1"}
])

Appointment.create!([
  {clinic: Clinic.first, hall: Hall.first, doctor: Doctor.first, patient: Patient.first, price_item: PriceItem.first, date: Time.zone.now-3.days, duration: 45},
  {clinic: Clinic.first, hall: Hall.first, doctor: Doctor.first, patient: Patient.first, price_item: PriceItem.second, date: Time.zone.now-2.days, duration: 30},
  {clinic: Clinic.second, hall: Hall.second, doctor: Doctor.third, patient: Patient.first, price_item: PriceItem.first, date: Time.zone.now-1.days, duration: 15},
  {clinic: Clinic.first, hall: Hall.first, doctor: Doctor.first, patient: Patient.second, price_item: PriceItem.first, date: Time.zone.now-3.days, duration: 60},
  {clinic: Clinic.first, hall: Hall.first, doctor: Doctor.first, patient: nil, price_item: PriceItem.first, date: Time.zone.now+3.days, fast: true, discount: 15},
  {clinic: Clinic.second, hall: Hall.second, doctor: Doctor.third, patient: nil, price_item: PriceItem.first, date: Time.zone.now+2.days, fast: true, discount: 30},
  {clinic: Clinic.second, hall: Hall.second, doctor: Doctor.third, patient: nil, price_item: PriceItem.first, date: Time.zone.now+12.hours, fast: true, discount: 10},
  {clinic: Clinic.first, hall: Hall.first, doctor: Doctor.first, patient: nil, price_item: PriceItem.first, date: Time.zone.now+6.days},
  {clinic: Clinic.second, hall: Hall.second, doctor: Doctor.third, patient: nil, price_item: PriceItem.first, date: Time.zone.now+6.days}
])

Schedule.create!([
  {doctor: Doctor.first, clinic: Clinic.first, schedule: {monday: [9, 17], friday: [8, 16], sunday: [8, 13]}},
  {doctor: Doctor.first, clinic: Clinic.second, schedule: {tuesday: [9, 17], wednesday: [8, 16], thursday: [8, 16], saturday: [8, 13]}},
  {doctor: Doctor.second, clinic: Clinic.first, schedule: {tuesday: [9, 17], wednesday: [8, 16], thursday: [8, 16], saturday: [8, 13]}},
  {doctor: Doctor.third, clinic: Clinic.second, schedule: {monday: [9, 17], friday: [8, 16], sunday: [8, 13]}},
  {doctor: Doctor.fourth, clinic: Clinic.second, schedule: {tuesday: [9, 17], wednesday: [8, 16], thursday: [8, 16], saturday: [8, 13]}}
])

Vacation.create!([
  {doctor: Doctor.fourth, from: Time.zone.today, to: Time.zone.today+30.days}
])
