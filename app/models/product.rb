class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  
  # Add these validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :category_id, presence: true
 

end