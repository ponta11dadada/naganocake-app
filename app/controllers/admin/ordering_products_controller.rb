class Admin::OrderingProductsController < ApplicationController

	def update
		@order = OrderingProduct.find(params[:id])
		@order.update(ordering_product_params)
		redirect_to admin_order_path(@order.order)
	end

	private
	def ordering_product_params
		params.require(:ordering_product).permit(:production_status)
	end
end
