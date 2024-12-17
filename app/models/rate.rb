class Rate < ApplicationRecord
    has_many :user_rate_products
    has_many :sale_products
end
