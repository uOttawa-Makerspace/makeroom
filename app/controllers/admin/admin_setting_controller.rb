class Admin::AdminSettingController < AdminAreaController
  layout 'admin_area'
  def index
    @new_organization = Organization.new
  end

  def add_organization
    if !params[:organization][:name].present?
      flash[:alert] = "Invalid organization name"

    else
      @new_organization = Organization.new(org_params)
      @new_organization.save
      flash[:notice] = "Organization added successfully"
    end

    redirect_to admin_admin_setting_index_path

  end

  def remove_organization
    if params[:remove_organization] != ""
      Organization.where(id: params[:remove_organization]).destroy_all
      flash[:notice] = "Organization removed successfully"
    else
      flash[:alert] = "Please select an organization"
    end
    redirect_to admin_admin_setting_index_path
  end


  def org_params
    params.require(:organization).permit(:name)
  end



end
