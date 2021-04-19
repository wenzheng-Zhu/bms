class User < ApplicationRecord
  validates :email, format: /@/
end
