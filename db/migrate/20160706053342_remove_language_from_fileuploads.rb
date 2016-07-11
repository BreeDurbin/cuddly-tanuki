class RemoveLanguageFromFileuploads < ActiveRecord::Migration[5.0]
  def change
    remove_column :fileuploads, :language, :string
  end
end
