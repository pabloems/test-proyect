class Appointment < ApplicationRecord

  # Asociaciones
  belongs_to :user
  belongs_to :patient

  # Validaciones
  validates :date, presence: true
  validates :date, uniqueness: {scope: :user_id}

end
