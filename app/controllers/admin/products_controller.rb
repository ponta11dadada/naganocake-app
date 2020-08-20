class Admin::ProductsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@all_products = Product.all
	end

	def new
		@new_product = Product.new
	end

	def create
		@new_product = Product.new(product_params)
		if @new_product.save(product_params)
		    redirect_to admin_products_path
		else
		 	render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
		   redirect_to admin_product_path(@product)
		else
		   render :edit
		end
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :name, :discription, :price, :image, :sales_status)
	end
end
