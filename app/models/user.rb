class User < ApplicationRecord
  belongs_to :address
  has_many :sales, dependent: :destroy
  has_secure_password
end
