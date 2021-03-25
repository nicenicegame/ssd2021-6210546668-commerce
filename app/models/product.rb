class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories

    validates :title, :description, :stock, presence: :true
    validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
