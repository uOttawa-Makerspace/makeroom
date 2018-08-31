class AdminAreaController < ApplicationController
  before_action :current_user
  before_action :ensure_admin

  private

  def ensure_admin
    @user = current_user
    unless @user && @user.admin?
      redirect_to '/' and return
    end
end
end
