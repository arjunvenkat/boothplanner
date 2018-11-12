class AddCoursePriceToCourseByProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :course_by_profs, :course_price, :float
  end
end
