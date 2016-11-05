class Seriesfranchise < ApplicationRecord
  belongs_to :series
  belongs_to :franchise
end
