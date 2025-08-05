class Property < ApplicationRecord
  has_many_attached :photos, dependent: :destroy

  validates :name, presence: true

  def cover
    photos.order(:created_at).offset(2).first
  end
end
