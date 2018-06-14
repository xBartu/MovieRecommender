class AddNameBirthToMoviesPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :movies_people, :name, :string
    add_column :movies_people, :birthdate, :datetime
  end
end
