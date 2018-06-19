class AddLanguageTypeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :language_type, :string
  end
end
