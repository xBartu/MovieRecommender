class DropMovieTable < ActiveRecord::Migration[5.2]
  def up
  	drop_table :movies
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
