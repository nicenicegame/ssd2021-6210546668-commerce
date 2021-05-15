class OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
  
        respond_to do |format|
          if @order.save
            format.html { redirect_to root_path, notice: "Order was successfully created." }
            format.json { render :show, status: :created, location: home_path }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
    end

    private

    def order_params
        params.require(:order).permit(:name, :product_name, :address)
    end
end