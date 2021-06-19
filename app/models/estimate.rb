class Estimate < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :product

  enum status: [:"受付中", :"送付済"]
end
