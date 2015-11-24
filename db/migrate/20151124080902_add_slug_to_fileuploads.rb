class AddSlugToFileuploads < ActiveRecord::Migration
  def change
    add_column :fileuploads, :slug, :string
    add_index :fileuploads, :slug, unique: true
  end
end
