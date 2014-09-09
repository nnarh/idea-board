class CreateIdeaMemberships < ActiveRecord::Migration
  def change
    create_table :idea_memberships do |t|
      t.belongs_to :idea, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
