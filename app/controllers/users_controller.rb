class UsersController < ApplicationController

  def edit
    @user = current_user
  end


  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end


  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation, :first_name, :last_name, :organization)
  end
end
