class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, :last_name, :description,
    presence: true
end
