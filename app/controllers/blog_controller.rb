class BlogController < ApplicationController
  def index
	@post = Post.all
  end
end
