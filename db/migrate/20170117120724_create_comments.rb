class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :users
      t.references :projects
      t.text :text
      t.timestamps null: false
    end
  end
end
