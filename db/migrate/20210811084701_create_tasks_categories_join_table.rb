class CreateTasksCategoriesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tasks, :categories
  end
end
