class Band < ApplicationRecord
  validates :name, presence: true
  has_many :albums,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Album
  has_many :tracks,
    through: :albums,
    source: :tracks
  has_many :tags,
    as: :taggable
end
