class AddUserIdToGameRecords < ActiveRecord::Migration
  def change
    add_column :game_records, :user_id, :integer
  end
end
