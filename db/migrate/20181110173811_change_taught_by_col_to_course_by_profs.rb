class ChangeTaughtByColToCourseByProfs < ActiveRecord::Migration[5.2]
  def change
    remove_column :evals, :taught_by_id, :integer
    add_column :evals, :course_by_prof_id, :integer
  end
end
