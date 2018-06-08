class PeopleController < ApplicationController
	def index
		# index method
		@people = Person.all
	end

	def new
		# new method
		@person = Person.new
	end

	def create
		# create method
    	# Warning: no user interaction
		@person = Person.new(person_params)
		# check the rule!
		if(@person.save)
			redirect_to @person
		else
			render 'new'
	end

	private def person_params
		params.require(:person).permit(:photo_url, :first_name, :last_name, :bio, :role_id)
	end
end
