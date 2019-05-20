class AddUserIdToGroups < ActiveRecord::Migration[5.2]
  def change
    rename_column :groups, :user_group_id, :user_id
  end
end
