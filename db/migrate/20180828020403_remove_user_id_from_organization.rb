class RemoveUserIdFromOrganization < ActiveRecord::Migration[5.1]
  def change
    remove_column :organizations, :user_id
  end
end
