class RemovelanguageTypefromprojects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :language_type, :string
  end
end
