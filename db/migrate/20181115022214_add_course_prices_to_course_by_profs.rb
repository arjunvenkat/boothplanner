class AddCoursePricesToCourseByProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :course_by_profs, :ft_course_price, :float
    add_column :course_by_profs, :pt_wknd_course_price, :float
  end
end
