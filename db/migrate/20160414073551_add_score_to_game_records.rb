class AddScoreToGameRecords < ActiveRecord::Migration
  def change
    add_column :game_records, :score, :integer
  end
end
