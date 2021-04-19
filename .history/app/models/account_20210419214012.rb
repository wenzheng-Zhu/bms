class Account < ApplicationRecord
  validates :user_id, :balance, presence: true
  belongs_to :user
  
  def withdraw(amount)
    adjust_balance_and_save(-amount)
  end

  def deposit(amount)
    adjust_balance_and_save(amount)
  end

  def adjust_balance_and_save(amount)
    self.balance += amount
    save!
  end
  
end

