class Author < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validate :book_present
  validate :user_present
  
  private
  def book_present
    if book.nil?
      errors.add(:book, "is not valid or is not active.")
    end
  end
 
  def user_present
    if user.nil?
      errors.add(:user, "is not a valid order.")
    end
  end
end
