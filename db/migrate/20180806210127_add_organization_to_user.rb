class AddOrganizationToUser < ActiveRecord::Migration[5.1]
  def change
      add_reference :users, :organization, index: true, foreign_key: true
  end
end
