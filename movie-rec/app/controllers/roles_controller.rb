class RolesController < ApplicationController
	def new
		@role = Role.new
	end
	
	def create
		@role = Role.new(role_params)
		if not(@role.save)
			render 'new'
		end
	end

	private def role_params
		params.require(:role).permit(:title)
	end
end
