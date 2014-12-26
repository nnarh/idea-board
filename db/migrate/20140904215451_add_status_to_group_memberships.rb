class AddStatusToGroupMemberships < ActiveRecord::Migration
  def change
    add_column :group_memberships, :approved, :boolean, default: false, null: false
  end
end
