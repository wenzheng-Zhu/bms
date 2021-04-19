class Loan < ApplicationRecord
  has_many :book
  belongs_to :account
end
