class CreateJoinTableMovieStar < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :stars do |t|
       t.index [:movie_id, :star_id]
       t.index [:star_id, :movie_id]
    end
  end
end
