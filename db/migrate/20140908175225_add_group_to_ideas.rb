class AddGroupToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :group, index: true
  end
end
