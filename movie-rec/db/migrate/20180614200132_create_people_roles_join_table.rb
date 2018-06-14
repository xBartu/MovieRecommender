class CreatePeopleRolesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :people, :roles do |t|
      t.references :people, foreign_key: true
      t.references :roles, foreign_key: true
    end
  end
end
