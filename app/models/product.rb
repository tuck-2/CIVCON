class Product < ApplicationRecord
  belongs_to :company
  has_many :product_images, dependent: :destroy
  belongs_to :type
  accepts_attachments_for :product_images, attachment: :image
end
