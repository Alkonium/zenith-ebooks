class CartsController < ApplicationController
  # GET /carts/1
  # GET /carts/1.json
  def show
    @order_items = current_order.order_items
  end

  def checkout
    @order_items = current_order.order_items
    
    @order_items.each do |order_item|
      Purchase.create (book_id: order_item.book_id, user_id: session[:user_id])
      order_item.destroy
    end
    
    current_order.order_status_id = 2
    
    render user(session[:user_id])
  end
end
