class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :bestanswer, :boolean, default: false
  end
end
