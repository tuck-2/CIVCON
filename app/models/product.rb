class Product < ApplicationRecord
  belongs_to :company
  has_many :product_images, dependent: :destroy
  belongs_to :type
  has_many :estimates, dependent: :destroy
  has_many :sizes, dependent: :destroy
  accepts_nested_attributes_for :sizes, allow_destroy: true
  accepts_attachments_for :product_images, attachment: :image
  mount_uploader :drawing, DrawingUploader
end
