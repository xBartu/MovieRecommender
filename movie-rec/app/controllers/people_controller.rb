class PeopleController < ApplicationController
	#people controller
	http_basic_authenticate_with name: "root", password: "1234", except:[:index, :show, :like, :unlike]
	before_action :authenticate_user!, except:[:index, :show, :new, :create, :destroy, :edit, :update]
	
	def index
		# index method
		@people = Person.all.paginate(:page => params[:page], :per_page => 12)
	end

	def new
		# new method
		# Warning: no user interaction
		@person = Person.new
		@roles = Role.all
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
    	@user_people = current_user.people
    end

    def edit
    	# edit method
    	# Warning: no user interaction
    	@person = Person.find(params[:id])
    	@roles = Role.all
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

	def like
		# like method
		@person = Person.find(params[:person_id])
		#check if user already liked!
		unless @person.users.include?(current_user)
			@person.users << current_user
		end
		redirect_to @person
	end

	def unlike
		# unlike method
		@person = Person.find(params[:person_id])
		#check if user already didn't like!
		if @person.users.include?(current_user)
			@person.users.delete(current_user)
		end
		redirect_to @person
	end

	private def person_params
		params.require(:person).permit(:photo_url, :first_name, :last_name, :bio, :role_id)
	end
end
