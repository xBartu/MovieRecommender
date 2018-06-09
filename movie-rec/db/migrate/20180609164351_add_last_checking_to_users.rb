class AddLastCheckingToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :last_notification, :datetime, null: false,  default: -> { 'CURRENT_TIMESTAMP' }
  end
end
