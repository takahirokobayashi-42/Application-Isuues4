class RenameOpnionColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :opnion, :body
  end
end
