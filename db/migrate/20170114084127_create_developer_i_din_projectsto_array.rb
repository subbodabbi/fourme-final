class CreateDeveloperIDinProjectstoArray < ActiveRecord::Migration
  def change
    remove_column :projects, :developers_id
    add_column :projects, :developers_id, :string, array: true, default: []
  end
end
