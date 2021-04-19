class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone, uniqueness: true
  validates :email, :phone, presence: true
  has_many :accounts
  after_create
end
