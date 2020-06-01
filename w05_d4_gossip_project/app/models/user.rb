class User < ApplicationRecord
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'PrivateMessage'
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  
  has_secure_password

  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    length: {in: 5..100},
    format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "n'est pas au bon format !" }
  validates :age,
    numericality: {only_integer: true, greater_than: 15}
  validates :password,
    presence:true,
    length: { minimum:6 }
end
