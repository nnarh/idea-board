class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  def self.search(query)
    where("title ILIKE ?", "%#{query}%")
  end
end
