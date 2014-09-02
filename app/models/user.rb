class User < ActiveRecord::Base
  has_many :ideas
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def join(group)
    groups << group
  end

  def leave(group)
    groups.delete(group)
  end

  def member?(group)
    groups.include?(group)
  end
end
