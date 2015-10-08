require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    
    test "Comment should have content" do 
        comment = Comment.new
        assert comment.invalid?, "Comments must have content."
        assert comment.errors[:body].any?
    end 
    
    test "Comments should be made on a commentable resource." do 
        comment = Comment.new(body: "Hello world!")
        assert comment.invalid?, "Must be made on a commentable resource"
        assert comment.errors[:commentable_type].any?
    end
    
    test "Comments on commentable resources are valid" do 
        comment = Comment.new(body: "Ciao Mondo!", commentable_type: "Post", commentable_id: 1)
        assert_not comment.invalid?, "Well commented, young chap."
    end 
end
