class RolesController < ApplicationController
	# this controller is not interacted by users. The views are not important
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
		end
	end

	def destroy
		# destroy method
		@role = Role.find(params[:id])
		@role.destroy
	end

	def show
		@roles = Role.all
	end

	private def role_params
		# no need for hidden inputs!
		params.require(:role).permit(:title)
	end
end
