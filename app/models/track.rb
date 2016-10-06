class Track < ApplicationRecord
  validates :name, :album_id, :bonus, :lyrics, presence: true
end
