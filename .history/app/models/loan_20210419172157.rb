class Loan < ApplicationRecord
  
  belongs_to :account
  has_one :book
end
