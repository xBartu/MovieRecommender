class AddReleaseDateToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :relase_date, :date
  end
end
