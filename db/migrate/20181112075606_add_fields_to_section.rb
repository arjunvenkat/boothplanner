class AddFieldsToSection < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :day, :string
    add_column :sections, :start_time, :time
    add_column :sections, :end_time, :time
  end
end
