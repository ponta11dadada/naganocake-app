class Public::CustomersController < ApplicationController
	before_action :authenticate_customer!
	def show
		@customer = Customer.find(params[:id])
		redirect_to products_path unless @customer.id == current_customer.id
	end

	def withdraw
		@customer = Customer.find_by(params[:id])
	end

	def withdraw_update
		@customer = Customer.find(params[:customer_id])
		@customer.update(members_status: false)
		reset_session
		redirect_to root_path
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
		   redirect_to public_customer_path(@customer)
		else
		   render edit
		end
	end

	def customer_params
  		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postalcode, :members_address, :phone_number)
  	end
end
