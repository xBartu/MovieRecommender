class CreateGenresUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :genres, :users do |t|
  		t.integer :genre_id
  		t.integer :user_id
  	end
  end
end
