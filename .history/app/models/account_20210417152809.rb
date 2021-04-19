class Account < ApplicationRecord
  validates :user_id
  belongs_to :user
end
