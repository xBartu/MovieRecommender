class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.title :name
      t.text :desc

      t.timestamps
    end
  end
end
