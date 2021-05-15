module Admins
    class OrdersController < ApplicationController
        before_action :authenticate_admin!

        def index
            @orders = Order.all
        end
    end
end