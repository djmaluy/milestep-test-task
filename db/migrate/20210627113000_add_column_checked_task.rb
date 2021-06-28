class AddColumnCheckedTask < ActiveRecord::Migration[6.1]
  def change
  	add_column :tasks, :checked, :boolean, default: false
  end
end
