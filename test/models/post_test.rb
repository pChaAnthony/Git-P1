require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  fixtures :posts
  
  test "Posts attributes must not be empty" do
	post = Post.new
	assert post.invalid?
	assert post.errors[:title].any?
	assert post.errors[:detail].any?
	end
	
  test "Posts is not valid without a unique title" do
    post = Post.new(:title 	=> posts(:ruby).title,
                    :detail	=> "yyyzzz" )
	assert !post.save
	assert_equal "has already been taken", post.errors[:title].join('; ')
	end
end