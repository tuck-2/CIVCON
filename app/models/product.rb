class Product < ApplicationRecord
  belongs_to :company
  has_many :product_images, dependent: :destroy
  belongs_to :type
  has_many :sizes, dependent: :destroy
  accepts_nested_attributes_for :sizes
  accepts_attachments_for :product_images, attachment: :image
end
