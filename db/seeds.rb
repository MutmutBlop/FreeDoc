require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all

20.times do
  city = City.create!(name: Faker::Address.city)
end

20.times do
doctor = Doctor.create!(
  first_name: Faker::Superhero.prefix,
  last_name: Faker::Games::Pokemon.name,
  specialty_id: City.all.sample.id,
  zip_code: Faker::Address.zip_code,
  city_id: City.all.sample.id
  )
end

Specialty.create!(specialty: "Généraliste", doctor_id: Doctor.all.sample.id)
Specialty.create!(specialty: "Dermato", doctor_id: Doctor.all.sample.id)
Specialty.create!(specialty: "Urologue", doctor_id: Doctor.all.sample.id)
Specialty.create!(specialty: "ORL", doctor_id: Doctor.all.sample.id)
Specialty.create!(specialty: "Marabout", doctor_id: Doctor.all.sample.id)

20.times do
patient = Patient.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city_id: City.all.sample.id
  )
end

20.times do
appointment = Appointment.create!(
  doctor: Doctor.all.sample,
  patient: Patient.all.sample,
  doctor_id: Doctor.all.sample.id,
  patient_id: Patient.all.sample.id,
  date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
  city_id: City.all.sample.id
  )
end
