class HomesController < ApplicationController

	def top
		@all_products = Product.all
	end

	def about
	end

end
