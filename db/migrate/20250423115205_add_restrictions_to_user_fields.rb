class AddRestrictionsToUserFields < ActiveRecord::Migration[8.0]
  def change
    User.where(first_name: nil).update_all(first_name: 'Placeholder')
    User.where(last_name: nil).update_all(last_name: 'Placeholder')
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false

  end
end
