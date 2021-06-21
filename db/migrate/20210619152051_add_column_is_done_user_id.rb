class AddColumnIsDoneUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :is_done, :boolean, default: false
    add_column :tasks, :user_id, :integer
  end
end
