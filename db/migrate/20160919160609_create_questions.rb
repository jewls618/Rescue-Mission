class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: 40
      t.string :description, null: false, length: 150

      t.timestamps
    end
  end
end
