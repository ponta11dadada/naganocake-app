class Order < ApplicationRecord

	has_many :ordering_products
	belongs_to :customer

	enum payment_method:{
		クレジットカード: true,
		銀行振込: false
	}

	enum order_status:{
		入金待ち: 0,
		入金確認: 1,
		作成中: 2,
		発送準備中: 3,
		発送済み: 4
	}

	def total_purchased_quantity
	sum = 0
	self.ordering_products.each do |ordering_product|
		sum += ordering_product.purchased_quantity
	end
	return sum
end
end
