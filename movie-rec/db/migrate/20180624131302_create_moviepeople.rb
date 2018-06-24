class CreateMoviepeople < ActiveRecord::Migration[5.2]
  def change
    create_table :moviepeople do |t|
      t.references :person, foreign_key: true
      t.references :movie, foreign_key: true
      t.string :role_name

      t.timestamps
    end
  end
end
