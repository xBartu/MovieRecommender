class MoviesController < ApplicationController
	#movies controller

	def index
		# index method 
		@movies = Movie.all
	end

	def new
		# new method
		# Warning: no user interaction
		@movie = Movie.new
	end

	def create
		# create method
    	# Warning: no user interaction
		@movie = Movie.new(movie_params)
		# check the rule!
		if(@movie.save)
			redirect_to @movie
		else
			render 'new'
		end
	end

	private def movie_params
		params.require(:movie).permit(:title, :desc, :photo, :genre_id)
	end
end
