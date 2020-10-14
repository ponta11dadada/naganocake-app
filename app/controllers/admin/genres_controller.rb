class Admin::GenresController < ApplicationController
	before_action :authenticate_admin!
	def index
		@all_genres = Genre.all
		@new_genre = Genre.new
	end

	def create
		@all_genres = Genre.all
		@new_genre = Genre.new(genre_params)
		@new_genre.save
		redirect_to admin_genres_path
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to admin_genres_path
	end

	private
	def genre_params
	    params.require(:genre).permit(:name, :is_valid)
	end

end
