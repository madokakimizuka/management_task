class ChangeColumnToPriority < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :priority, :integer, null: false, default: 0
  end
end
