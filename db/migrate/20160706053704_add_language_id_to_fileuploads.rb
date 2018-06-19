class AddLanguageIdToFileuploads < ActiveRecord::Migration[5.2]
  def change
    add_column :fileuploads, :language_id, :integer
  end
end
