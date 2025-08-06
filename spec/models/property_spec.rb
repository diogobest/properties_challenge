require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'associations' do
    it 'has many photos' do
      # arrange
      property = Property.create(name: 'Test Property')

      # act
      property.photos.attach(io: File.open("spec/fixtures/image1.jpg"),
                             filename: 'mockfile.jpg')
      property.photos.attach(io: File.open("spec/fixtures/image1.jpg"),
                             filename: 'mockfile2.jpg')

      # assert
      expect(property.photos.count).to eq(2)
    end
  end

  describe 'validations' do
    it 'shows errors when name is not informed' do
      # arrange
      property = Property.new

      # act & assert
      expect(property.valid?).to be_falsey
      expect(property.errors.full_messages).to include("Name can't be blank")
    end
  end
end
