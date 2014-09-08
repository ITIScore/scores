class Event < ActiveRecord::Base
  has_many :relations
  has_one :users

  belongs_to :owner, class_name: 'User'
end
