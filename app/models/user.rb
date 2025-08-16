class User < ApplicationRecord
  has_secure_password   # <-- this enables password + password_confirmation

  # Associations
  belongs_to :province, optional: true
  has_many :orders, foreign_key: 'user_id', dependent: :destroy
  has_many :cart_items, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :province_id, presence: true
end
