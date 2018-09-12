class Admin::UsersController < AdminAreaController
  def index
    if !params[:sort].present? && !params[:direction].present?
      params[:sort] = "name"
      params[:direction] = "desc"
    end

    @users = User.all.order('last_name ASC').paginate(page: params[:page], per_page: 10)
  end

  def search
    unless params[:query].blank?
      @query = params[:query]
      @users = User.all.order('last_name ASC').paginate(page: params[:page], per_page: 10)
      @found_users = User.where('LOWER(first_name) like LOWER(?) OR
                           LOWER(last_name) like LOWER(?) OR
                           LOWER(username) like LOWER(?) OR
                           LOWER(email) like LOWER(?)',
                           "%#{@query}%", "%#{@query}%", "%#{@query}%", "%#{@query}%")
                           .order(:updated_at).paginate(page: params[:page], per_page: 5)
    else
      redirect_to admin_users_path
      flash[:alert] = "Invalid parameters!"
    end
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end


end
