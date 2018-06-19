class AddSlugToFileuploads < ActiveRecord::Migration[5.2]
  def change
    add_column :fileuploads, :slug, :string
    add_index :fileuploads, :slug, unique: true
  end
end
