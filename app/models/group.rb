class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_one :users
  has_many :students

  def owner?(user)
    owner == user_id
  end
end
