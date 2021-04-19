class Account < ApplicationRecord
  validates :user_id, :balance, :amount, presence: true
  belongs_to :user
  validate :balance_must_not_be_negative

  def balance_must_not_be_negative
    errors
  end
end
