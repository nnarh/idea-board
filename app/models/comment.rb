class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  default_scope -> { order(created_at: :asc) }
end
