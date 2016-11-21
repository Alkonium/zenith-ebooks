class Book < ApplicationRecord
  validates :title, presence: true
  validates :synopsis, presence: true
  validates :manuscript, presence: true
  validates :coverart, presence: true
  mount_uploader :manuscript, ManuscriptUploader
  mount_uploader :coverart, CoverArtUploader
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
    where("synopsis LIKE ?", "%#{search}%")
  end
end
