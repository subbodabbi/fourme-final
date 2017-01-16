class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :user
      t.string :title
      t.belongs_to :developers
      t.text :description
      t.string :languages_required, array: true, default: []
      t.timestamps null: false
    end
  end
end
