class CreateGameRecords < ActiveRecord::Migration
  def change
    create_table :game_records do |t|
      t.string :exam ,array: true
      t.string :situation, array: true
      t.string :cost_time

      t.timestamps null: false
    end
  end
end
