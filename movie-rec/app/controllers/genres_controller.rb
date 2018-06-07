class GenresController < ApplicationController
    def index
    	#index method
        @genres = Genre.all
    end

    def show
    	#show method
    end

    def new
    	# new method
    	# Warning: no user interaction
    	@genre = Genre.new
    end

    def create
    	# create method
    	# Warning: no user interaction
		@genre = Genre.new(genre_params)
		# check the rule!
		if(@genre.save)
			# TODO when show works cahnge this!
			redirect_to action: "index"
		else
			render 'new'
		end
    end

    def destroy
		# destroy method
		# Warning: no user interaction
		@genre = Genre.find(params[:id])
		@genre.destroy
		redirect_to action: "index"
	end

	def edit
		# edit method
		# Warning: no user interaction
		@genre = Genre.find(params[:id])
	end

	def update
		# update method
		@genre = Genre.find(params[:id])
		# check for the rule
		if(@genre.update(genre_params))
			# TODO when show works cahnge this!
			redirect_to action: "index"
		else
			render 'edit'
		end

    private def genre_params
    	params.require(:genre).permit(:name, :desc)
    end
end
