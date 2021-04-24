class HomeController < ApplicationController
    def index
        @products = Product.all
        render layout: "home"
    end

    def show
        @product = Product.find(params[:product_id])
    end
end