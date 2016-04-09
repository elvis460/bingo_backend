class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :birthday

      t.timestamps null: false
    end
  end
end
