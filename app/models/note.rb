class Note < ApplicationRecord
  validates :user_id, :track_id, :body, presence: true
  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  belongs_to :track,
    primary_key: :id,
    foreign_key: :track_id,
    class_name: :Track
  has_many :tags,
    as: :taggable
end
