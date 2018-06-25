class AddPlaceOfBirthToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :place_of_birth, :string
  end
end
