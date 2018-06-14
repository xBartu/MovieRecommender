class GenresController < ApplicationController
	# Genres Controller
	http_basic_authenticate_with name: "root", password: "1234", except:[:index, :show, :follow, :unfollow]
	before_action :authenticate_user!, except:[:index, :show, :new, :create, :destroy, :edit, :update]

    def index
    	# index method
        @genres = Genre.all.paginate(:page => params[:page], :per_page => 12)
    end

    def show
    	# show method
    	@genre = Genre.find(params[:id])
    	@movies = Movie.where(genre: @genre)
    	if(current_user)
    		@user_genres = current_user.genres
    	end
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
		# follow a genre
		@genre = Genre.find(params[:genre_id])
		# do not follow if user already follows
		unless @genre.users.include?(current_user)
			@genre.users << current_user
		end
		redirect_to @genre
	end

	def unfollow
		# unfollow method
		@genre = Genre.find(params[:genre_id])
		# do not follow if user already follows
		if @genre.users.include?(current_user)
			@genre.users.delete(current_user)
		end
		redirect_to @genre
	end

    private def genre_params
    	params.require(:genre).permit(:name, :desc, :photo_url)
    end
end