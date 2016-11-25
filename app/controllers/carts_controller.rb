class CartsController < ApplicationController
  # GET /carts/1
  # GET /carts/1.json
  def show
    @order_items = current_order.order_items
  end

  def checkout
    @order_items = current_order.order_items
    
    @order_items.each do |order_item|
      Purchase.create(book_id: order_item.book_id, user_id: session[:user_id])
    end
    
    current_order.order_status_id = 2
    
    @old_order = Order.where(id: session[:order_id])
    
    @new_order = Order.create
    session[:order_id] = @new_order.id
    
  end
  
  def buynow
    @buynow = Order.new
    Purchase.create(book_id: @book.id, user_id: session[:user_id])
    OrderItem.create(book_id: @book.id, order_id: @buynow.id)
    @buynow.status = 3
    @order_item = OrderItem.where(book_id: @book.id,order_id: session[:order_id])
    if (@order_item.nil?)
      @order_item.destroy
    end
  end
end
