class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.string :fname
      t.string :lname
      t.text :bio
      t.string :photo_url

      t.timestamps
    end
  end
end
