class RenameOpinionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :opinion, :introduction
  end
end
