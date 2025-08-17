class Page < ApplicationRecord
    # Add these validations
    validates :name, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true
    validates :phone, format: { with: /\A\+?[0-9\s\-\(\)]{10,}\z/ }, allow_nil: true
  end