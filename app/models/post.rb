class Post < ActiveRecord::Base
	validates :title, :detail, :presence => true
end
