class Product < ApplicationRecord
    enum status: [:draft, :published, :archived], _default: :draft

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories

    has_one_attached :primary_image
    has_many_attached :supporting_images

    validates :title, :description, :stock, presence: :true
    validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
