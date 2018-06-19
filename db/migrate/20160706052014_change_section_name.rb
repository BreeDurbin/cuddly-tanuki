class ChangeSectionName < ActiveRecord::Migration[5.2]
  def change
    rename_column :fileuploads, :section, :language
  end
end
