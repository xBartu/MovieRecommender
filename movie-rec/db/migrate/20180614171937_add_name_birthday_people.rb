class AddNameBirthdayPeople < ActiveRecord::Migration[5.2]
  def change
  	add_column :people, :name, :string
    add_column :people, :birthdate, :datetime
  end
end
