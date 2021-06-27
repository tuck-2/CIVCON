class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :estimates

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_num, presence: true
end
