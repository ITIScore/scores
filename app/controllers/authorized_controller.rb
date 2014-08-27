class AuthorizedController < ApplicationController
  before_action :authenticate_user!

  expose(:group) { current_user.group }

  private

  def check_owner
    head :unauthorized unless group.owner?(current_user)
  end
end
