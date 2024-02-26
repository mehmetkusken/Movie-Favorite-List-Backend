class FavoritesController < ApplicationController

    def index
        favorites = logged_in_user.favorites
        render json: favorites
    end

    def create
        movie = Movie.find(params[:movie_id])
        user = logged_in_user
        favorite = Favorite.create(movie:movie , user: user )
        render json: {message: "Successfully added favorite"}
    end

    def destroy
    
        favorite = Favorite.find(params[:id])
        favorite.destroy
        render json: {message: "Successfully removed favorite"}
    end
end
