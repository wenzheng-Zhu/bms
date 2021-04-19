class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone, uniqueness: true
  validates :email, :phone, presence: true
  has_many :accounts
  after_create :create_account

  private

  def create_account
    self.accounts.build(user_id: self.id, amount: ENV["amounts_can_be_borrowed"].to_i, balance: 0)
  end

end
