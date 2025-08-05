class Property < ApplicationRecord
  has_many :photos, dependent: :destroy

  validates :name, presence: true

  def cover
    photos.order(:created_at).offset(2).first
  end
end
