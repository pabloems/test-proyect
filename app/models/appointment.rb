class Appointment < ApplicationRecord

  # Asociaciones
  belongs_to :user
  belongs_to :patient

  # Validaciones
  validates :date, :patient_id, presence: true
  validates :time, uniqueness: { scope: [:date, :user_id]}

  def cita
    self.date.strftime("%a, %e %b %Y")
  end

end
