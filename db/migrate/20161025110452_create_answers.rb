class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :type
      t.string :response

      t.timestamps
    end
  end
end
