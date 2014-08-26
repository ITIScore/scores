class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  serialize :roles, Array

  belongs_to :administration

  after_create :create_admin_if_needed

  def setup_as_superadmin?
    administration.blank?
  end

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  private

  def create_admin_if_needed
    create_admin if setup_as_superadmin?
  end

  def create_admin
    new_admin = Administration.create owner_id: id
    update_attributes roles: ['superadmin'], administrations_id: new_admin.id
  end
end
