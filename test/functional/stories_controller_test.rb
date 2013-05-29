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

  test 'should create story' do
    story = build :story

    param = {
      title: story.title,
      description: story.description,
      owner_id: story.owner_id,
      performer_id: story.performer_id
    }

    post :create, story: param
    assert_response :redirect

    story = Story.find_by_title(story.title)
    assert_not_nil story
  end

  test 'should update story' do
    story_attr = attributes_for :story

    post :update, {id: @story.id, story: story_attr}
    assert_response :redirect

    @story.reload
    assert_equal story_attr[:title], @story.title
  end

  test 'should remove strory' do
    delete :destroy, {id: @story}
    assert_response :redirect

    assert !Story.exists?(@user)
  end

  test 'should set story state to started' do
    put :update, id: @story, story: {state_event: :start}
    assert_response :redirect
    
    @story.reload
    assert @story.started?
  end
end
