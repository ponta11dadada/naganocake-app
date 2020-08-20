class Public::CartItemsController < ApplicationController
	before_action :authenticate_customer!
	def index
		@order_product = CartItem.new

		@order_products = CartItem.where(customer_id: current_customer)
		@total = 0
		 @order_products.each do |order_product|
		 @total += order_product.quantity_in_cart * order_product.product.price
 		end
	end

	def update
		@order_product = CartItem.find(params[:id])
		@order_product.update(cart_item_params)
		redirect_to public_cart_items_path
	end

	def destroy
		order_product = CartItem.find(params[:id])
		order_product.destroy
		redirect_to public_cart_items_path
	end

	def create
		@order_product = CartItem.new(cart_item_params)
		@order_product.product_id = params[:product_id]
		@order_product.customer_id = current_customer.id

		order_product = current_customer.cart_items.find_by(product_id: @order_product.product_id)

		if order_product
			order_product.quantity_in_cart = order_product.quantity_in_cart + @order_product.quantity_in_cart
			order_product.save
			redirect_to public_cart_items_path
		else
			@order_product.save
			redirect_to public_cart_items_path
		end
	end

	def all_destroy
		@order_products = CartItem.where(customer_id: current_customer).destroy_all
		redirect_to public_cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:cutomer_id, :product_id, :quantity_in_cart)
	end
end
