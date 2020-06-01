# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Speciality.destroy_all
JoinSpecialityDoctor.destroy_all

5.times do
  city = City.new(name: Faker::Address.city)
  city.save
  puts "1 ville a été ajoutée wesh !"
end

5.times do
  speciality = Speciality.create!(speciality: Faker::Superhero.name)
  puts "Et une spécialité de plus, une !"
end

20.times do
  doctor = Doctor.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Code.npi, city: City.all.sample)
  doctor.save
  puts "Un docteur a ete cree, youpi."
end

5.times do
  join_specialities_doctors = JoinSpecialityDoctor.new(doctor: Doctor.all.sample, speciality: Speciality.all.sample)
  join_specialities_doctors.save
  puts "1 médecin avec des spés !"
end

20.times do
    patient = Patient.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample)
    patient.save
    puts "Un patient a ete cree, wahou."
  end

10.times do
    appointment = Appointment.new(date: Faker::Date.in_date_period(year: 2020, month: 5), doctor: Doctor.all.sample, patient: Patient.all.sample, city: City.all.sample)
    appointment.save
    puts "Un rendez-vous a été créé ! On est vraiment trop fort :D"
end
