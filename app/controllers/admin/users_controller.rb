class Admin::UsersController < AdminAreaController

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end


  def make_admin
    binding.pry
    @user = User.find(params[:id])
    @user.set_role("admin")
    @user.skip_password_validation = true
    if @user.save
      redirect_to admin_users
    else
      redirect_to admin_users
    end
  end


end
