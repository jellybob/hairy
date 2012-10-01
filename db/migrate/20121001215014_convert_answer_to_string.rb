class ConvertAnswerToString < ActiveRecord::Migration
  def change
    change_column :votes, :answer, :string
  end
end
