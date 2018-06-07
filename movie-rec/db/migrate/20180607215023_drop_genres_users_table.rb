class DropGenresUsersTable < ActiveRecord::Migration[5.2]
  def up
  	drop_table :genres_users
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
