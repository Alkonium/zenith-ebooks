class Book < ApplicationRecord
  validates :title, presence: true
  validates :synopsis, presence: true
end
