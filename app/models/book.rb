class Book < ApplicationRecord
  has_many :order_items
  validates :title, presence: true
  validates :synopsis, presence: true
  mount_uploader :manuscript, ManuscriptUploader
  mount_uploader :coverart, CoverArtUploader
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%").or(where("synopsis LIKE ?", "%#{search}%"))
  end
end
