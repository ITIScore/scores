class AdministrationsController < ApplicationController

  expose(:administrations)
  expose(:administration)
  expose(:user) { current_user }

  def update
    administration.update(admin_params)
    redirect_to administrations_path, notice: 'Changes are saved.'
  end

  private

  def admin_params
    params.require(:administration).permit(
      :firstname,
      :lastname,
      :owner_id
    )
  end
end
