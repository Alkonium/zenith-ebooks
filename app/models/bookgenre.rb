class Bookgenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre
  
  validate :book_present
  validate :genre_present
  
  private
  def book_present
    if book.nil?
      errors.add(:book, "is not valid or is not active.")
    end
  end
 
  def genre_present
    if genre.nil?
      errors.add(:genre, "is not a valid order.")
    end
  end
end
