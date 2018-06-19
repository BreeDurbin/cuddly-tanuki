class RemoveLanguageFromFileuploads < ActiveRecord::Migration[5.2]
  def change
    remove_column :fileuploads, :language, :string
  end
end
