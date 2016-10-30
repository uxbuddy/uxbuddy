class AddStatusToTestTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :test_types, :status, :string
  end
end
