class Idea < ActiveRecord::Base
  has_many :idea_memberships
  has_many :teammates, through: :idea_memberships, source: :user

  belongs_to :user
  belongs_to :group

  validates :title, presence: true
  validates :description, presence: true

  def self.search(query)
    where("title ILIKE ?", "%#{query}%")
  end
end
