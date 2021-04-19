class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone, uniqueness: true
  validates :email, :phone, presence: true
  has_one :account
  after_create :create_account, :set_quantity_default_value

  private

  def create_account
    Account.create(user_id: self.id, balance: 20.00)
  end

  def set_quantity_default_value
    self.update(quantity: ENV["amounts_can_be_borrowed"].to_i)
  end

end
