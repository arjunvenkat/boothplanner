class ChangeDataTypeOfCourseId < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_by_profs, :course_id, :string
    add_column :course_by_profs, :course_id, :integer
  end
end
