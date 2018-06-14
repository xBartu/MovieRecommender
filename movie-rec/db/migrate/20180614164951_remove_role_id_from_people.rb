class RemoveRoleIdFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :role_id, :Integer
  end
end
