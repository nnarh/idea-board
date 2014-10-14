class FixIdeaColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :ideas_id, :idea_id
  end
end
