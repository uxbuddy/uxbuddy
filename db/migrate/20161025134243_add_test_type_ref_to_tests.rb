class AddTestTypeRefToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :tests, :test_type, foreign_key: true
  end
end
