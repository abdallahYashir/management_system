class AddDefaultToUsersActive < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :active, false
  end
end
