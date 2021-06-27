class Estimate < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :product

  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :product_id, presence: true
  validates :description, presence: true
  validates :status, presence: true

  enum status: [:"受付中", :"送付済"]
end
