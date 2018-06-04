class GenresController < ApplicationController
    def index
        #list all the genres
        # TODO introduce theme
        @genres = Genre.all
    end

    def show
    end
end
