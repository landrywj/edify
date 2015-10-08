require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  
  test "Post body must not be empty" do 
    post = Post.new
    assert post.invalid? 
    assert post.errors[:body].any? 
  end 
  
  test "Post must have a Creator" do
      post = Post.create(user_id: nil)
    assert post.invalid?
    assert post.errors[:user_id].any? 
   end

    
end
