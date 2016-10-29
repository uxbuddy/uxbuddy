class AddTestRefToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :test, foreign_key: true
  end
end
