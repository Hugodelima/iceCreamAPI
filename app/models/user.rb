class User < ApplicationRecord
  belongs_to :address
  has_many :sales, dependent: :destroy
  has_secure_password
  has_many :user_rate_products
end
