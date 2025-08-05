require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'associations' do
    it 'has many photos' do
      # arrange
      property = Property.create(name: 'Test Property')
      photo = Photo.create(image_url: 'http://example.com/photo1.jpg', property: property)
      photo2 = Photo.create(image_url: 'http://example.com/photo2.jpg', property: property)

      # act
      property.photos << photo
      property.photos << photo2

      # assert
      expect(property.photos.count).to eq(2)
    end
  end

  describe 'validations' do
    it 'has a name' do
      # arrange
      property = Property.new

      # act & assert
      expect(property.valid?).to be_falsey
      expect(property.errors.full_messages).to include("Name can't be blank")
    end
  end
end
