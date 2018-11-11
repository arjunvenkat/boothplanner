class AddMetadataColsToCourseByProfs < ActiveRecord::Migration[5.2]
  def change
    add_column :course_by_profs, :overall_rating, :float
    add_column :course_by_profs, :hours_per_week, :float
  end
end
