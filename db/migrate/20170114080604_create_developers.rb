class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|

      t.belongs_to :users
      t.string :name
      t.string :skills, array: true, default: []
      t.text :description
      t.string :motto
      t.string :avatar
      t.integer :score
      t.timestamps null: false
    end
  end
end
