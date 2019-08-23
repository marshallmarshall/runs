class ChangeTreadmillInclineDefaultValueInRuns < ActiveRecord::Migration[5.1]
  def change
    change_column_default :runs, :treadmill_incline, '1'
  end
end
