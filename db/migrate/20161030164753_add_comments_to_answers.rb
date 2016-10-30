class AddCommentsToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :comment, :string
  end
end
