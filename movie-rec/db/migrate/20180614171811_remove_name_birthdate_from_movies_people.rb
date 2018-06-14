class RemoveNameBirthdateFromMoviesPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies_people, :name, :string
    remove_column :movies_people, :birthdate, :datetime
  end
end
