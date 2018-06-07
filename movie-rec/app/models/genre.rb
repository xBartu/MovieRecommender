class Genre < ApplicationRecord
	# name should not be empty
    validates :name, presence: true
    has_and_belongs_to_many :users
    validates_associated :users
end
