class Loan < ApplicationRecord
  has_many :books
  belongs_to :account
end
