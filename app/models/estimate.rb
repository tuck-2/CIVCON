class Estimate < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :product
end
