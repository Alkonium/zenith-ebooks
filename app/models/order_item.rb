class OrderItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order
  
  validate :book_present
  validate :order_present
 
  before_save :finalize
 
  def unit_price
    if persisted?
      self[:unit_price]
    else
      book.price
    end
  end
 
  def total_price
    unit_price
  end
 
private
  def book_present
    if book.nil?
      errors.add(:book, "is not valid or is not active.")
    end
  end
 
  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end
 
  def finalize
    self[:unit_price] = unit_price
  end
end
