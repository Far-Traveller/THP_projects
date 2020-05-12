class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User"

  validates :start_date, :location,
    presence: true
  validate :date_future?

  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validate :multiple_of_5?

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 1001 }


    private

    def date_future?
      errors.add(:start_date, "Impossible de créer un event dans le passé") if self.start_date <= DateTime.now()
    end
  
    def multiple_of_5?
        errors.add(:duration, "Le nombre de minutes doit être un multiple de 5") unless self.duration % 5 == 0
    end

end
