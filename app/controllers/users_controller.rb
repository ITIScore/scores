class UsersController < AuthorizedController

  expose(:user)
  expose(:users)

  def create
    user = current_user.users.new(user_params)
    user.save
    respond_with(user)
  end

  private

  def user_params
    params.require(:group).permit(
      :full_name
    )
  end
end
