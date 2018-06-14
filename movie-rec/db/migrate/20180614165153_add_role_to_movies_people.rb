class AddRoleToMoviesPeople < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies_people, :role, foreign_key: true, null: false
  end
end
