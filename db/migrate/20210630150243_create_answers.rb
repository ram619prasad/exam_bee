class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :answer
      t.text :description
      t.string :correct
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
