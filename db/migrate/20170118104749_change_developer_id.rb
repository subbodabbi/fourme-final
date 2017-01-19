class ChangeDeveloperId < ActiveRecord::Migration
  def change
  	remove_column :projects, :developers_id
  	add_column :projects, :developers_id, :integer, array: true, default: []
  end
end
