class RolesController < ApplicationController
	def new
		@role = Role.new
	end

	def create
		@role = Role.new(role_params)
		if(not @role.save)
			render 'new'
		end
	end

	def edit
		@role = Role.find(params[:id])
	end

	def update
		@role = Role.find(params[:id])
		if(not @role.update(role_params))
			render 'edit'
		end
	end

	private def role_params
		params.require(:role).permit(:title)
	end
end
