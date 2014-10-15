class BlogController < ApplicationController
	skip_before_filter :authorize

  def index
	@post = Post.all
	@cart = current_cart
	
    if params[:set_locale]
      redirect_to blog_url(locale: params[:set_locale])
    end
  end
end
