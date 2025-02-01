class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_products
  has_many :products, through: :sale_products

  accepts_nested_attributes_for :sale_products, allow_destroy: true
end
