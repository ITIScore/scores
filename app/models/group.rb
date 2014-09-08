class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  has_one :users
  has_many :students
  has_many :relations

  def owner?(user)
    owner == user_id
  end
end
