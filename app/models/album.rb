class Album < ApplicationRecord
  validates :band_id, :name, :year, :live, presence: true
end
