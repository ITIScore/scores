class Student < ActiveRecord::Base
  has_one :group
  has_many :relations
end
