class MoviesController < ApplicationController
	#movies controller

	def index
		# index 
		@movies = Movie.all
	end
end
