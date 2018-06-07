class GenresController < ApplicationController
    def index
    	#index method
        #list all the genres
        # TODO introduce theme
        @genres = Genre.all
    end

    def show
    end

    def new
    	@genre = Genre.new
    end

    def create
    	# create method
		@genre = Genre.new(genre_params)
		# check the rule!
		if(@genre.save)
			# TODO when show works cahnge this!
			redirect_to action: "index"
		else
			render 'new'
		end
    end

    private def genre_params
    	params.require(:genre).permit(:name, :desc)
    end
end
