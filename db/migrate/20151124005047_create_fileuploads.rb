class CreateFileuploads < ActiveRecord::Migration
  def change
    create_table :fileuploads do |t|
      t.string :section
      t.string :title
      t.text :description
      t.string :source
      t.string :bin

      t.timestamps null: false
    end
  end
end
