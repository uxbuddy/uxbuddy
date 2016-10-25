class CreateDefaultQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :default_questions do |t|
      t.string :type
      t.text :text

      t.timestamps
    end
  end
end
