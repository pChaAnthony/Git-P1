class Post < ActiveRecord::Base
	validates :title, :detail, :presence => true
	validates :title, :uniqueness => true
end
