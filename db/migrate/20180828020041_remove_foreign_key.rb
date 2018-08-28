class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :organizations, column: :user_id
  end
end
