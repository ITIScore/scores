class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_many :users

  def owner?(user)
    owner == user_id
  end
end
