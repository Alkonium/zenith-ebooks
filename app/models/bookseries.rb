class Bookseries < ApplicationRecord
  belongs_to :book
  belongs_to :series
end
