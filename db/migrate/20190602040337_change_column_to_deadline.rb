class ChangeColumnToDeadline < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :deadline, :date, null: false, default: "2030-01-01"
  end
end
