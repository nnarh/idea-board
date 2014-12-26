class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ideas
  has_many :idea_memberships
  has_many :joined_ideas, through: :idea_memberships, source: :idea
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def join_group(group)
    groups << group
  end

  def join_idea(idea)
    joined_ideas << idea
  end

  def leave_group(group)
    groups.delete(group)
  end

  def leave_idea(idea)
    joined_ideas.delete(idea)
  end

  def member_group?(group)
    groups.include?(group)
  end

  def member_idea?(idea)
    joined_ideas.include?(idea)
  end
end
