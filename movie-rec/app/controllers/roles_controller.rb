class RolesController < ApplicationController
	# this controller is not interacted by users. The views are not important
	http_basic_authenticate_with name: "root", password: "1234", except:[:index]
	def new
		# new method for new page
		@role = Role.new
	end

	def create
		# create method
		@role = Role.new(role_params)
		# check the rule!
		if(not @role.save)
			render 'new'
		else
			redirect_to action: "index"
		end
	end

	def edit
		# edit method
		@role = Role.find(params[:id])
	end

	def update
		# update method
		@role = Role.find(params[:id])
		# check rules
		if(not @role.update(role_params))
			render 'edit'
		else
			redirect_to action: "index"
		end
	end

	def destroy
		# destroy method
		@role = Role.find(params[:id])
		@role.destroy
		redirect_to action: "index"
	end

	def index
		# index method
		@roles = Role.all
	end

	private def role_params
		# no need for hidden inputs!
		params.require(:role).permit(:title)
	end
end
