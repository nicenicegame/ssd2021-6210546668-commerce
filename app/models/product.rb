class Product < ApplicationRecord
    enum status: { draft: 0, published: 1, archived: 2 }

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories

    validates :title, :description, :stock, presence: :true
    validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
