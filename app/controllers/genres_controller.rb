class GenresController < ApplicationController
    def new 
        @genre = Genre.new
    end 

    def index 
        @genre = Genre.all
    end 
    
    def show
        @genre = Genre.find(params[:id])
    end 

    def create 
        @genre = Genre.new 
        @genre.name = params[:genre][:name]
        @genre.save
        redirect_to genre_path(@genre)
    end 

    def edit 
        @genre = Genre.find(params[:id]) 
    end 

    def update
        @genre = Genre.find(params[:id])
        @genre.update(params.require(:genre).permit(:name))
        redirect_to genre_path(@genre)
    end 

    private

    def genre_params(*args)
        params.require(:genre).permit(*args)
    end
end
