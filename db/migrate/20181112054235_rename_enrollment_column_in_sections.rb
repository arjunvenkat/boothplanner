class RenameEnrollmentColumnInSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :phase_4_enrollment, :integer
  end
end
