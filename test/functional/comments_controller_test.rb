require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @comment = create :comment
    sign_in @user

    @request.env['HTTP_REFERER'] = root_path
  end

  test 'should create comment' do
    
    comment = build :comment

    param = {
      owner_id: comment.owner_id,
      story_id: comment.story_id,
      message: comment.message,
    }

    post :create, comment: param
    assert_response :redirect

    comment = Comment.find_by_message(comment.message)
    assert comment
  end

  test 'should destroy comment' do
    delete :destroy, {id: @comment}
    assert_response :redirect

    assert !Comment.exists?(@comment)
  end
end