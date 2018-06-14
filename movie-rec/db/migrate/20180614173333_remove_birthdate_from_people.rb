class RemoveBirthdateFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_column :people, :birthdate, :datetime
  end
end
