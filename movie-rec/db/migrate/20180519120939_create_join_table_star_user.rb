class CreateJoinTableStarUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :stars, :users do |t|
      t.index [:star_id, :user_id]
      t.index [:user_id, :star_id]
    end
  end
end
