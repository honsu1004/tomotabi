class AddDeviseFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    ## Database authenticatable は既にあるので追加不要

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    add_index :users, :reset_password_token, unique: true
  end
end
