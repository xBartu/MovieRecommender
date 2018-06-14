class MoviesController < ApplicationController
	include MoviesHelper
	#movies controller
	protect_from_forgery with: :null_session
	http_basic_authenticate_with name: "root", password: "1234", except:[:index, :show, :notification]
	before_action :authenticate_user!, except:[:index, :show, :new, :create, :destroy, :edit, :update, :add_people, :add_person]
	
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
		@movie = Movie.find(params[:movie_id])
	end

	def add_person
		# add person method
		# Warning: no user interaction
		@movie = Movie.find(params[:movie_id])
		person = Person.find(movie_person_params["person_id"])
		unless @movie.people.include?(person)
			@movie.people << person
		else
			@movie.people.delete(person)
		end
		redirect_to @movie
	end

	def notification
		# notification method

		# TODO START {convert it to sql}
		arr = Array.new
		current_user.people.each do |person|
			person.movies.each do |movie|
				if movie.created_at > current_user.last_notification
					arr.push(movie) 
				end
			end
		end
		movies = Movie.where(genre_id:current_user.genres).where("created_at>?",current_user.last_notification)
		movies.each do |movie|
			arr.push(movie)
		end
		@newmovies = arr.uniq
		# TODO END

		current_user.last_notification = DateTime.now 
		current_user.save
	end

	def recommendations
		# recommendations method

		# TODO START {convert it to sql}
		arr = Array.new
		current_user.people.each do |person|
			person.movies.each do |movie|
				arr.push(movie)
			end
		end
		movies = Movie.where(genre_id:current_user.genres).where("created_at>?",current_user.last_notification)
		movies.each do |movie|
			arr.push(movie)
		end
		@moives = arr
		# TODO END
	end

	private def movie_params
		params.require(:movie).permit(:title, :desc, :photo, :genre_id)
	end

	private def movie_person_params
		params.require(:movie).permit(:person_id)
	end
end
