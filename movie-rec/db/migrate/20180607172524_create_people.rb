class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :photo_url
      t.string :first_name
      t.string :last_name
      t.text :bio

      t.timestamps
    end
  end
end
