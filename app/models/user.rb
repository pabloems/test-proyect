class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asociaciones
  has_many :patients, through: :appointments
  has_many :appointments, dependent: :destroy


  # Validaciones
  validates :name, :last_name, :phone, :email, presence: true
  validates :phone, length: {minimum: 9}
  validates :email, presence: true, format: { with: /\A[\w|.|-]+@[\w|-]+\.\w+\z/ }

  def complete_name
    self.name + " " + self.last_name
  end

end
