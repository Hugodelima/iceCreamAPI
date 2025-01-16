class Product < ApplicationRecord
  belongs_to :category
  has_many :user_rate_products
  has_many :sale_products
  validates :image_url, format: { with: /\Ahttps?:\/\/.*\.(jpg|jpeg|png|gif)\z/, message: "deve ser uma URL válida de imagem" }, allow_blank: true
end
