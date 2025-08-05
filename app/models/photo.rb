class Photo < ApplicationRecord
  belongs_to :property

  validates :image_url, presence: true
end
