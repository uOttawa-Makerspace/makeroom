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

  def make_admin
    @user = User.find(params[:id])
    @user.set_role("admin")
    @user.skip_password_validation = true
    if @user.save
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
    end
  end

  def make_staff
    @user = User.find(params[:id])
    @user.set_role("staff")
    @user.skip_password_validation = true
    if @user.save
      redirect_to admin_users_path
    else
      redirect_to admin_users_path
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email,:password, :password_confirmation, :organization_id )
  end
end
