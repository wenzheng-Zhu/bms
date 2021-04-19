class Account < ApplicationRecord
  validates :user_id, :balance, :amount, presence: true
  belongs_to :user
  validate :balance_must_be_above_zero


end
