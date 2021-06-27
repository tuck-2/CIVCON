class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :estimates, dependent: :destroy

  validates :name, presence: true
  validates :group, presence: true
  validates :department, presence: true
  validates :phone_num, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
end
