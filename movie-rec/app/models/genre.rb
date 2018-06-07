class Genre < ApplicationRecord
	# name should not be empty
    validates :name, presence: true
end
