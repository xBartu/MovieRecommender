class RolesController < ApplicationController
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
