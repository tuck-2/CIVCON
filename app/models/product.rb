class Product < ApplicationRecord
  belongs_to :campany
  has_many :product_images, dependent: :destroy
end
