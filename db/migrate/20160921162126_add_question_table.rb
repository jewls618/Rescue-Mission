class AddQuestionTable < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :title, :string, null: false, length: { minimum: 40}
    add_column :questions, :description, :string, null: false, length: { minimum: 150}
  end
end
