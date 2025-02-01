class Rate < ApplicationRecord
    belongs_to :user
    belongs_to :product
  
    validates :star, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    validates :comment, presence: true
  end
  