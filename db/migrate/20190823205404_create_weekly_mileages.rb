class CreateWeeklyMileages < ActiveRecord::Migration[5.1]
  def change
    create_table :weekly_mileages do |t|
      t.date :week_starting
      t.float :weekly_mileage
      t.integer :user_id

      t.timestamps
    end
  end
end
