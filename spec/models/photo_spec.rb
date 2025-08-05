require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'associations' do
    it 'has a belongs_to' do
      # arrange
      property = Property.create(name: 'Test Property')
      photo = Photo.new(image_url: 'http://example.com/photo1.jpg', property: property)

      # assert
      expect(photo.valid?).to be_truthy
    end

    it 'raises error when property is nil' do
      # arrange
      photo = Photo.new(image_url: 'http://example.com/photo1.jpg')

      # act & assert
      expect(photo.valid?).to be_falsey
      expect(photo.errors.full_messages).to include("Property must exist")
    end
  end

  describe 'validations' do
    it 'has a image_url' do
      # arrange
      photo = Photo.new

      # act & assert
      expect(photo.valid?).to be_falsey
      expect(photo.errors.full_messages).to include("Image url can't be blank")
    end
  end
end
