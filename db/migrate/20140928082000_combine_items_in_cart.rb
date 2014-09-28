class CombineItemsInCart < ActiveRecord::Migration
	def up
		Cart.all.each do |cart|
			# count each cart's post is the same
			sums = cart.line_items.group(:post_id).sum(:quantity)
		
			sums.each do |post_id, quantity|
				if quantity > 1
					# remove all same post
					cart.line_items.where(:post_id => post_id).delete_all
					# add one back
					cart.line_items.create(:post_id => post_id, :quantity => quantity)
				end
			end
		end
	end

	def down
		LineItem.where("quantity>1").each do |lineitem|
			lineitem.quantity.times do 
				LineItem.create :cart_id => lineitem.cart_id, :post_id => lineitem.post_id, :quantity => 1
			end
			lineitem.destroy
		end
	end
end
