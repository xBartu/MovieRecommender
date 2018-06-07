class Role < ApplicationRecord
	has_many :persons
	# title should not be empty
	validates :title, presence: true
end
