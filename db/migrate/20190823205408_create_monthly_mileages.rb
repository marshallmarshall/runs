class CreateMonthlyMileages < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_mileages do |t|
      t.date :month_starting
      t.float :monthly_mileage
      t.integer :user_id

      t.timestamps
    end
  end
end
