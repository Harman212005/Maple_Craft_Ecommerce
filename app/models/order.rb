class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items, dependent: :destroy

  # Validations
  validates :user_id, presence: true
  validates :province_id, presence: true
  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: %w[pending shipped on_the_way delivered],
                                  message: "%{value} is not a valid status" }

  accepts_nested_attributes_for :order_items

  STATUSES = %w[pending shipped on_the_way delivered].freeze
end
