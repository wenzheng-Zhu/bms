class Loan < ApplicationRecord
  has_one :book
  belongs_to :account
end
