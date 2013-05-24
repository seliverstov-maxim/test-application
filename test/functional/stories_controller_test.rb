require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @story = create :story
    sign_in @user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'shoul get show' do
    get :show, {id: @story}
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    get :edit, {id: @story}
    assert_response :success
  end

  test 'should crate story' do
    story_attr = attributes_for :story

    post :create, story_attr
    assert_response :redirect

    story = Story.find_by_title(story_attr[:title])
    assert_not_nil story
  end

  test 'should update story' do
  end

  test 'should remove strory' do
  end
end
