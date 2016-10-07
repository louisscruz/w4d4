class Track < ApplicationRecord
  validates :name, :album_id, :lyrics, presence: true
  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album
  has_one :band,
    through: :album,
    source: :band
  has_many :notes,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Note
  has_many :noters,
    through: :notes,
    source: :user
  has_many :tags,
    as: :taggable
end
