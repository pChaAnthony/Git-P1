class Post < ActiveRecord::Base
	default_scope { order 'title' }
	validates :title, :detail, :presence => true
	validates :title, :uniqueness => true
end
