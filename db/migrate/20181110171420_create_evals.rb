class CreateEvals < ActiveRecord::Migration[5.2]
  def change
    create_table :evals do |t|
      t.integer :taught_by_id
      t.string :section
      t.string :quarter
      t.integer :year
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
