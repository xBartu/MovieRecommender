class AddPhotoToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :photo_url, :string
  end
end
