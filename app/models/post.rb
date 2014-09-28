class Post < ActiveRecord::Base
	default_scope { order 'title' }
	validates :title, :detail, :presence => true
	validates :title, :uniqueness => true
	
	has_many :line_items
	
	before_destroy :ensure_not_referenced_by_any_line_item
	# ensure there are no line item reference to this post
	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			error[:base] << "There are Cart Line Items exist"
			return false
		end
	end
end
