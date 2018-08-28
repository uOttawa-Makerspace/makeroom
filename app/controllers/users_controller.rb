class UsersController < ApplicationController
  before_action :current_user, except: [:create, :new]

  def edit
    @user = current_user
    @bookings = @user.bookings.order("id DESC").paginate(page: params[:page], per_page: 10)
    if @user.organization_id.present?
      @user_organization_id = @user.organization_id
    else
      @user_organization_id = Organization.first.id
    end
  end

  def update_profile
    @user = current_user
    @user.skip_password_validation = true
    if @user.update(user_params)
      flash[:notice] = "Profile updated Successfully"
      redirect_to edit_user_path
    else
      flash[:error] = "Could not save the changes."
      render 'edit'
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,:password, :password_confirmation, :organization_id )
  end
end
