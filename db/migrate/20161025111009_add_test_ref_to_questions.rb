class AddTestRefToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :test, foreign_key: true
  end
end
