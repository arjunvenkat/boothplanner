class RenameEnrollmentColumnInSections < ActiveRecord::Migration[5.2]
  def change
    remove_column :sections, :phase_4_total_enrollment, :integer
    add_column :sections, :phase_4_enrollment, :integer
  end
end
