class CreateCourseByProfs < ActiveRecord::Migration[5.2]
  def change
    create_table :course_by_profs do |t|
      t.string :course_id

      t.timestamps
    end
  end
end
