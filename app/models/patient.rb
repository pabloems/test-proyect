class Patient < ApplicationRecord

  # Asociaciones
  has_many :users, through: :appointments
  has_many :appointments, dependent: :destroy

  # Validaciones
  validates :name, :last_name, :phone, presence: true

  def complete_name
    self.name + " " + self.last_name
  end

end
