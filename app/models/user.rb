class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  serialize :roles, Array

  belongs_to :group
  has_one :group
  has_many :events

  after_create :create_admin_if_needed

  def setup_as_superadmin?
    group.blank?
  end

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def owner?(user)
    user.create_events.empty?
  end

  private

  def create_admin_if_needed
    create_admin if setup_as_superadmin?
  end

  def create_admin
    new_group = Group.create user_id: id
    update_attributes roles: ['superadmin'], group_id: new_group.id
  end
end
