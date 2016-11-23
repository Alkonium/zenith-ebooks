class CartsController < ApplicationController
  # GET /carts/1
  # GET /carts/1.json
  def show
    @order_items = current_order.order_items
  end

end
