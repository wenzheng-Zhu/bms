class Account < ApplicationRecord
  validates :user_id, :balance, :amount, presence: true
  belongs_to :user
  validate :balance_must_not_be_negative

  def balance_must_not_be_negative
    errors.add(:balance, "is negative") if balance < 0
  end

  def with_draw(amount)
  end

  def deposit()
end
