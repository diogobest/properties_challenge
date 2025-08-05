class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.references :property, null: false, foreign_key: true
      t.string :image_url, required: true

      t.timestamps
    end
  end
end
