class ProductsController < ApplicationController
	def index
		@all_products = Product.all
		@all_genres = Genre.all
	end

	def show
		@product =Product.find(params[:id])
	end
end
