require 'will_paginate/array'
class MoviesController < ApplicationController
	#movies controller
	protect_from_forgery with: :null_session
	http_basic_authenticate_with name: "root", password: "1234", except:[:index, :show, :notification, :recommendations]
	before_action :authenticate_user!, except:[:index, :show, :new, :create, :destroy, :edit, :update, :add_people, :add_person, :add_genre, :add_genres]
	
	def index
		# index method 
		@movies = Movie.all.paginate(:page => params[:page], :per_page => 12)
	end

	def show
		# show method
		@people = Movieperson.where(movie_id:params[:id])
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

	def add_genres
		# add_genres method(view)
		# Warning: no user interaction
		@genres = Genre.all
		@movie = Movie.find(params[:movie_id])
	end

	def add_genre
		# add_genre method
		# Warning: no user interaction
		@movie = Movie.find(params[:movie_id])
		genre = Genre.find(genre_params["genre_id"])
		unless @movie.genres.include?(genre)
			@movie.genres << genre
		else
			@movie.genres.delete(genre)
		end
		redirect_to @movie
	end


	def notification
		# notification method
		# TODO START {convert it to sql}
		arr = Array.new
		current_user.people.each do |person|
			movies = Movie.where(id: Movieperson.select(:movie_id).where(person_id:person.id))
			movies.each do |movie|
				if movie.created_at > current_user.last_notification
					arr.push(movie) 
				end
			end
		end
		genres = current_user.genres
		genres.each do |genre|
			genre.movies.each do |movie|
				if movie.created_at > current_user.last_notification
					arr.push(movie)
				end
			end
		end
		arr = arr.uniq
		# TODO END
		@newmovies = arr
		current_user.last_notification = DateTime.now 
		current_user.save
	end

	def recommendations
		# recommendations method
		# TODO START {convert it to sql}
		arr = Array.new
		current_user.people.each do |person|
			movies = Movie.where(id: Movieperson.select(:movie_id).where(person_id:person.id))
			movies.each do |movie|
				arr.push(movie)
			end
		end
		genres = current_user.genres
		genres.each do |genre|
			arr.concat genre.movies
		end
		@movies = arr.uniq.shuffle
		@movies = @movies.paginate(:page => params[:page], :per_page => 12)
		# TODO END
	end

	private def movie_params
		params.require(:movie).permit(:title, :desc, :photo, :relase_date)
	end

	private def movie_person_params
		params.require(:movie).permit(:person_id, :role_id)
	end

	private def genre_params
		params.require(:movie).permit(:genre_id)
	end
end
