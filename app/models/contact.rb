class Contact < ApplicationRecord
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :message, length: { minimum: 200 }
  validates :message, length: { maximum: 10000 }
end
