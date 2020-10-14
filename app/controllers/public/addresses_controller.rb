class Public::AddressesController < ApplicationController
	before_action :authenticate_customer!
	def index
		@all_addresses = Address.where(customer_id: current_customer)
		@new_address = Address.new
	end

	def create
		@new_address = Address.new(address_params)
		@new_address.customer_id = current_customer.id
		@new_address.save!(address_params)
		redirect_to public_addresses_path
	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		redirect_to public_addresses_path
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		@address.update!(address_params)
		redirect_to public_addresses_path
	end

	private
	def address_params
		params.require(:address).permit(:customer_id, :registration_postalcode, :registration_address, :address)
	end
end
