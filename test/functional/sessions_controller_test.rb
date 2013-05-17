require 'test_helper'
class SessionsControllerTest < ActionController::TestCase
  setup do 
    @user = users(:Bob)
  end

  test 'user login successfully' do 
    post :create, {email: @user.email, password: 'testpass'}
    assert_redirected_to root_url
    assert_equal @user.id, session[:user_id]
  end

  test 'user login failed' do
    post :create, {email: @user.email, password: 'invalid password'}
    assert_response :success
    assert_nil session[:user_id]
  end
end