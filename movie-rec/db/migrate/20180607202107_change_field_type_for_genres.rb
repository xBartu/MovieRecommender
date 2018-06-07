class ChangeFieldTypeForGenres < ActiveRecord::Migration[5.2]
	def self.up
		change_table :genres do |t|
			t.change :photo_url, :text
		end
    end
    def self.down
    	change_table :genres do |t|
    		t.change :photo_url, :string
    	end
    end
end
