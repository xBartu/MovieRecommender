class MoviesController < ApplicationController
	#movies controller

	def index
		# index method 
		@movies = Movie.all
	end

	def show
		# show method
		@movie = Movie.find(params[:id])
	end

	def new
		# new method
		# Warning: no user interaction
		@movie = Movie.new
		@genres = Genre.all
	end

	def create
		# create method
    	# Warning: no user interaction
		@movie = Movie.new(movie_params)
		@genres = Genre.all # TODO why needs?
		# check the rule!
		if(@movie.save)
			redirect_to @movie
		else
			render 'new'
		end
	end

	def edit
    	# edit method
    	# Warning: no user interaction
    	@movie = Movie.find(params[:id])
    	@genres = Genre.all
    end

    def update
		# update method
		# Warning: no user interaction
		@movie = Movie.find(params[:id])
		# check for the rule
		if(@movie.update(movie_params))
			redirect_to @movie
		else
			render 'edit'
		end
	end

	def destroy
		# destroy method
		# Warning: no user interaction
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to action: "index"
	end

	def add_people
		# add_people method(view)
		# Warning: no user interaction
		@people = Person.all
	end

	def add_person
		# add person method
		# Warning: no user interaction
		@movie = Movie.find(params[:movie_id])
		person = Person.find(movie_person_params)
		unless @movie.people.include?(person)
			@movie.people << person
		end
		redirect_to @movie
	end

	private def movie_params
		params.require(:movie).permit(:title, :desc, :photo, :genre_id)
	end

	private def movie_person_params
		params.require(:movie).permit(:person_id)
	end
end
