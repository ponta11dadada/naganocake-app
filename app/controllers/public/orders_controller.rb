class Public::OrdersController < ApplicationController
	before_action :authenticate_customer!
	def new
		@neworder = Order.new
		@addresses = Address.where(customer_id: current_customer)
	end

	def confirm
		@cart_items = CartItem.where(customer_id: current_customer)
		@total = 0
		 @cart_items.each do |item|
		 @total += item.quantity_in_cart * item.product.price
		end
		@freight = 800
		@total_fee = @total + @freight

		@neworder = Order.new(order_params)

		if params[:order_address] == "my_address"
			@address = current_customer.postalcode+current_customer.members_address+current_customer.last_name+current_customer.first_name
			@neworder.postalcode = current_customer.postalcode
			@neworder.address = current_customer.members_address
			@neworder.addressee = current_customer.last_name+current_customer.first_name
		elsif params[:order_address] == "register_address"
			@address_record = Address.find(params[:selected_address])
			@address = @address_record.registration_postalcode+@address_record.registration_address+@address_record.address
			@neworder.postalcode = @address_record.registration_postalcode
			@neworder.address = @address_record.registration_address
			@neworder.addressee = @address_record.address
		elsif params[:order_address] == "new_address"
			@address = @neworder.postalcode+@neworder.address+@neworder.addressee
		end
	end

	def create
		@cart_items = CartItem.where(customer_id: current_customer)
		@neworder = Order.new(order_params)
		@neworder.customer_id = current_customer.id
		@neworder.freight = 800
		@total = 0
		@cart_items.each do |item|
			@total += item.quantity_in_cart * item.product.price
		end
		@neworder.total_fee = @total + @neworder.freight

		if @neworder.save
			@cart_items.each do |item|
				@order_product = OrderingProduct.new(order_id: @neworder.id, product_id: item.product_id, purchased_price: item.product.price, purchased_quantity: item.quantity_in_cart, production_status: 0)
				@order_product.save
			end
			@cart_items = CartItem.where(customer_id: current_customer).destroy_all
		  redirect_to public_orders_thanks_path
		 else
		 	render :confirm
		 end
	end

	def thanks
	end

	def index
		@all_orders = Order.where(customer_id: current_customer)
	end

	def show
		@order = Order.find(params[:id])
		@total = 0
		@order.ordering_products.each do |product|
			@total += product.product.price.to_i * product.purchased_quantity.to_i
		end
	end

	private
	def order_params
	    params.require(:order).permit(:payment_method, :postalcode, :address, :addressee)
	end
end

# books/1 => parmas[:id] = 1
# @book = Book.find(params[:id])

# @order.address = params[:order][:address]
# @order.save