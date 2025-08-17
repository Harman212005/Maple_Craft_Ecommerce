class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  # Add these validations
  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end