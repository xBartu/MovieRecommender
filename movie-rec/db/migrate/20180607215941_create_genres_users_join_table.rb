class CreateGenresUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :genres, :users do |t|
	    t.index :genre_id
	    t.index :user_id
	  end
  end
end
