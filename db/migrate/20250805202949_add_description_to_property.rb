class AddDescriptionToProperty < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :description, :text, null: true
  end
end
