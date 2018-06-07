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
		@genre = Genre.new(role_params)
		# check the rule!
		if(not @genre.save)
			render 'new'
		else
			# TODO when show works cahnge this!
			redirect_to action: "index"
		end
    end
end
