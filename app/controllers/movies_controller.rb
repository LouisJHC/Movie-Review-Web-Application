class MoviesController < ApplicationController
    def index
        @movies = Movie.all.order("created_at DESC")
    end
    
    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(movie_params)
    
        if @movie.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def show
        @movie = Movie.find(params[:id])
    end
    
    def edit
        @movie = Movie.find(params[:id])
    end
    
    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            redirect_to movie_path(@movie)
        else
            render 'edit'
        end
    end
    
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
            redirect_to root_path
    end
    
    
    
    private
        def movie_params
            params.require(:movie).permit(:title,:description,:director,:runtime)
        end
end
