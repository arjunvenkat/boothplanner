class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :number
      t.integer :course_id
      t.integer :course_by_prof_id
      t.string :quarter
      t.integer :year
      t.string :day
      t.time :start_time
      t.time :end_time
      t.integer :phase_1_enrollment
      t.integer :phase_1_seats_available
      t.integer :phase_1_price
      t.integer :phase_2_enrollment
      t.integer :phase_2_price
      t.integer :phase_3_enrollment
      t.integer :phase_3_seats_available
      t.integer :phase_3_price
      t.integer :phase_4_total_enrollment
      t.integer :phase_4_seats_available
      t.integer :phase_4_price
      t.integer :enrl
      t.integer :num_responses
      t.integer :percent_responded
      t.float :hours_per_week
      t.float :clear
      t.float :interesting
      t.float :useful
      t.float :overall
      t.float :reccommend

      t.timestamps
    end
  end
end
