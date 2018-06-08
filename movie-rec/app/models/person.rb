class Person < ApplicationRecord
  belongs_to :role
  has_and_belongs_to_many :users
  has_and_belongs_to_many :movies
end
