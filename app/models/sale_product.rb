class SaleProduct < ApplicationRecord
  belongs_to :rate
  belongs_to :sale
  belongs_to :product
end
