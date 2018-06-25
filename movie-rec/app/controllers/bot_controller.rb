class BotController < ApplicationController
	def create_genres
		# a method to create the necessary genres
		genres = Tmdb::Genre.movie_list
    text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
    img = "http://via.placeholder.com/350x350"
    genres.each do |genre|
     	Genre.create(:name => genre.name, :photo_url => img, :desc => text)
    end
  end

  def create_person(person_id)
  	# a method to create person
  	person = Tmdb::Person.detail(person_id)
  	photo = "http://via.placeholder.com/300x200"
  	if person.profile_path
  		photo = "https://image.tmdb.org/t/p/w600_and_h900_bestv2"+person.profile_path
  	end 
  	return Person.create(:name => person.name, :bio => person.biography, :birthday => person.birthday, :photo_url => photo, :place_of_birth => person.place_of_birth)
  end 

  def get_or_create_person(name, person_id)
  	# a method to get the person by name
  	if Person.exists?(name: name)
  		return Person.where(name: name).first
  	else
  		return self.create_person(person_id)
  	end
  end

  def add_cast(movie_id, movie)
    # a method to get cast and add them
    # Note: person_id is used if the person does not exist in the db
    cast = Tmdb::Movie.cast(movie_id)
    cast.each do |info|
	    if info.id 
	      person = get_or_create_person(info.name, info.id)
	      Movieperson.create(:person => person, :movie => movie, :role_name => info.character)
	    end
    end
  end

  def add_genres(genres, movie)
    # a function to add genres
    genres.each do |genre|
    	genre_obj = Genre.where(name: genre.name).first
      movie.genres << genre_obj
    end
  end

  def get_movie(movie_id)
    # a method to get the movie information
    movie = Tmdb::Movie.detail(movie_id)
    # TODO check if exist
    movie_obj = Movie.create(:title => movie.title, :desc => movie.overview, :photo => "https://image.tmdb.org/t/p/w600_and_h900_bestv2"+movie.poster_path, :relase_date => movie.release_date)
    if movie.genres.any?
      self.add_genres(movie.genres, movie_obj)
    end
   	self.add_cast(movie_id, movie_obj)
  end

  def add_movies
  	# a method to add functions
  	i = Movie.count
  	while Movie.count < 10001
  		begin
  			self.get_movie(i)
  		rescue
  			#go ahead
  			# should be logged but not needed for now
  			break
  		end
  		i += 1
  	end
  end
end
