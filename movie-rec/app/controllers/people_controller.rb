class PeopleController < ApplicationController
	#people controller
	http_basic_authenticate_with name: "root", password: "1234", except:[:index, :show]
	
	def index
		# index method
		@people = Person.all
	end

	def new
		# new method
		# Warning: no user interaction
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
	end

	def show
    	# show method
    	@person = Person.find(params[:id])
    end

    def edit
    	# edit method
    	# Warning: no user interaction
    	@person = Person.find(params[:id])
    end

    def update
		# update method
		# Warning: no user interaction
		@person = Person.find(params[:id])
		# check for the rule
		if(@person.update(person_params))
			redirect_to @person
		else
			render 'edit'
		end
	end

	def destroy
		# destroy method
		# Warning: no user interaction
		@person = Person.find(params[:id])
		@person.destroy
		redirect_to action: "index"
	end

	private def person_params
		params.require(:person).permit(:photo_url, :first_name, :last_name, :bio, :role_id)
	end
end
