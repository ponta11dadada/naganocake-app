class Product < ApplicationRecord

	has_many :cart_items
	has_many :ordering_products

	belongs_to :genre
	attachment :image

	enum genre:{
		プリン: 0,
		クッキー: 1,
		和菓子: 2,
		タルト: 3,
		ケーキ: 4,
		焼き菓子: 5,
		キャンディ: 6
	}
end
