class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :account
      t.boolean :del_mark,   default: false

      t.timestamps null: false
    end
  end
end
