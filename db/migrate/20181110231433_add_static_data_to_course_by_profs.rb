class AddStaticDataToCourseByProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :course_by_profs, :course_number, :string
    add_column :course_by_profs, :course_title, :string
    add_column :course_by_profs, :instructors_string, :string
    add_column :course_by_profs, :instructor_ids, :string
  end
end
