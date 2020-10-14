class Admin::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@all_orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)

		# order_status = @order.order_status
		if @order.order_status == "入金確認"
			@order.ordering_products.each do |ordering_product|
				# ordering_product.production_status = "制作待ち"
				ordering_product.update(production_status: "製作待ち")
			end
		end
		redirect_to admin_order_path(@order)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
