class AddColumnsToCourseByProf < ActiveRecord::Migration[5.2]
  def change
    add_column :course_by_profs, :clear, :float
    add_column :course_by_profs, :interesting, :float
    add_column :course_by_profs, :useful, :float
    add_column :course_by_profs, :reccommend, :float
  end
end
