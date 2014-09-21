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
end
