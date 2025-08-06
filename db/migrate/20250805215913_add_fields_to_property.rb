class AddFieldsToProperty < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :state, :string, null: true
    add_column :properties, :city, :string, null: true
    add_column :properties, :available_date, :date, null: true
    add_column :properties, :value, :date, null: true
    add_column :properties, :address, :date, null: true
  end
end
