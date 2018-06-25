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

  def get_movie(movie_id)
    # a method to get the movie information
    movie = Tmdb::Movie.detail(movie_id)
    # TODO check if exist
    Movie.create(:title => movie.title, :desc => movie.overview, :photo => "https://image.tmdb.org/t/p/w600_and_h900_bestv2"+movie.poster_path, :relase_date => movie.release_date)
    # add genres
    # add cast
  end

  def add_movies
  	# a method to add functions
  	i = 1
  	while Movie.count < 30
  		begin
  			self.get_movie(i)
  		rescue
  			#go ahead
  			# should be logged but not needed for now
  		end
  		i += 1
  	end
  end
end
