class CreateTeachings < ActiveRecord::Migration[5.2]
  def change
    create_table :teachings do |t|
      t.integer :course_by_prof_id
      t.integer :instructor_id

      t.timestamps
    end
  end
end
