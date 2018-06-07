class GenresController < ApplicationController
	# Genres Controller
	http_basic_authenticate_with name: "root", password: "1234", except:[:index, :show]

    def index
    	# index method
        @genres = Genre.all
    end

    def show
    	# show method
    	@genre = Genre.find(params[:id])
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
			redirect_to @genre
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
			redirect_to @genre
		else
			render 'edit'
		end
	end

	def follow
		@genre = Genre.find(params[:genre_id])
		unless @genre.users.include?(current_user)
			@genre.users << current_user
		end
		redirect_to @genre
	end
	
    private def genre_params
    	params.require(:genre).permit(:name, :desc, :photo_url)
    end
end
