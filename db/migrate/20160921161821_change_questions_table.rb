class ChangeQuestionsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :title, :string
    remove_column :questions, :description, :string
  end
end
