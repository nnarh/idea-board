class Comment < ActiveRecord::Base
  belongs_to :ideas

  validates :title, presence: true,
    length: { minimum: 10 }
end
