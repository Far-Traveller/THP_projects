class User < ApplicationRecord
  after_create :welcome_send
  
  has_many :attendances
  has_many :events, through: :attendances

  validates :first_name, :last_name, :description,
    presence: true

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
