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
  end

  test 'should get edit' do
  end

  test 'should crate story' do
  end

  test 'should update story' do
  end

  test 'should remove strory' do
  end
end
