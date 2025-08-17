class Category < ApplicationRecord
  has_many :products
  
  # Add these validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end