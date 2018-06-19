class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :section
      t.string :title
      t.text :description
      t.string :source
      t.string :bin
      t.string :image

      t.timestamps null: false
    end
  end
end
