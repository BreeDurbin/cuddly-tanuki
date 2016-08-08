class AddCodeToFileuploads < ActiveRecord::Migration[5.0]
  def up
    add_attachment :fileuploads, :code
    remove_column :fileuploads, :source, :string
    remove_column :fileuploads, :bin, :string
  end

  def down
    remove_attachment :fileuploads, :code
  end
end
