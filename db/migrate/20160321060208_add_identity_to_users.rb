class AddIdentityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identity, :integer
  end
end
