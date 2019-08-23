class CreateRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :runs do |t|
      t.date :date_of_run
      t.integer :training_week
      t.float :miles_planned
      t.float :miles_actual
      t.float :treadmill_incline
      t.integer :run_duration_minutes
      t.integer :run_duration_seconds
      t.string :actual_pace
      t.integer :location_id
      t.string :notes
      t.integer :user_id
      t.integer :shoe_id

      t.timestamps
    end
  end
end
