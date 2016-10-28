class ChangeResponseTypeToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :answers, :response, 'integer USING CAST(response AS integer)'
  end
end
