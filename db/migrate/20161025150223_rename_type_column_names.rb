class RenameTypeColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :questions, :type, :format
    rename_column :answers, :type, :format
  end
end
