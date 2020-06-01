class Speciality < ApplicationRecord
  has_many :join_speciality_doctors  
  has_many :doctors, through: :join_speciality_doctors
end