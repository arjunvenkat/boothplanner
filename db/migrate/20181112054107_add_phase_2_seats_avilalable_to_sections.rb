class AddPhase2SeatsAvilalableToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :phase_2_seats_available, :integer 
  end
end
