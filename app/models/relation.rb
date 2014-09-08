class Relation < ActiveRecord::Base
  belongs_to :students
  has_many :events
  has_one :group
end
