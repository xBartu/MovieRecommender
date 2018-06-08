class CreateMoviesPeopleJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :movies, :people do |t|
	    t.index :movie_id
	    t.index :person_id
	  end
  end
end
