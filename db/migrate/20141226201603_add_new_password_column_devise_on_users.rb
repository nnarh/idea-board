class AddNewPasswordColumnDeviseOnUsers < ActiveRecord::Migration
  def change
    rename_column :users, :password_digest, :encrypted_password
  end
end
