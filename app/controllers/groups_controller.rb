class GroupsController < AuthorizedController
  expose(:user) { group.users }
  # before_action :check_owner, only: %i(update)

  def update
    group.update(group_params)
    redirect_to group, notice: 'Changes are saved.'
  end

  private

  def group_params
    params.require(:group).permit(
      :number,
      :user_id
    )
  end
end
