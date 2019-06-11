class ChangColumnToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :status, :integer, null: false, default: 0
    add_index :tasks, :status
  end
end
