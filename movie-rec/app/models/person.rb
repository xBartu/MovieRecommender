class Person < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :movies
  has_and_belongs_to_many :roles
end
