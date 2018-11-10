class CreateTaughtBies < ActiveRecord::Migration[5.2]
  def change
    create_table :taught_bies do |t|
      t.integer :course_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end
