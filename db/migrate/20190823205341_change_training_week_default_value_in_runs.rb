class ChangeTrainingWeekDefaultValueInRuns < ActiveRecord::Migration[5.1]
  def change
    change_column_default :runs, :training_week, '0'
  end
end
