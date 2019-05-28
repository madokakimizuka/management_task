class ChangeColumnToTitleAndContent < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :title, :string, null: false, limit: 25
    change_column :tasks, :content, :text
  end
end
