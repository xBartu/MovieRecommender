class Role < ApplicationRecord
	has_and_belongs_to_many :people
	# title should not be empty
	validates :title, presence: true
end
