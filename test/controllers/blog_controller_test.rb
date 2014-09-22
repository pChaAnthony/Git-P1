require 'test_helper'

class BlogControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
	assert_select '#columns #side a' , :minimum => 4
	assert_select '#main .entry' , 3
	assert_select 'h3' , 'Programming Ruby 1.9'
    assert_response :success
  end

end
