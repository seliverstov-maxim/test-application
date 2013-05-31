require 'test_helper'

class Web::Story::CommentsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @comment = create :comment
    @story = create :story

    sign_in @user
    @request.env['HTTP_REFERER'] = root_path
  end

  test 'should create comment' do
    comment = attributes_for(:comment).merge(owner_id: @user.id, story_id: @story.id)

    post :create, {comment: comment, story_id: comment[:story_id]}
    assert_response :redirect

    comment = Comment.find_by_message(comment[:message])
    assert comment
  end

  test 'should destroy comment' do
    delete :destroy, {id: @comment, story_id: @comment.story_id}
    assert_response :redirect

    assert !Comment.exists?(@comment)
  end
end