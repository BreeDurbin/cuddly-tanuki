class ChangeSectionName < ActiveRecord::Migration[5.0]
  def change
    rename_column :fileuploads, :section, :language
  end
end
