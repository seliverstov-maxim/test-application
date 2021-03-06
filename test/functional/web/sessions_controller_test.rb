require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do 
    @user = create :user
  end

  test 'user login successfully' do 
    post :create, {email: @user.email, password: 'secret'}
    assert_redirected_to root_url

    assert signed_in?
  end

  test 'user logout successfully' do
    sign_in @user

    delete :destroy, {id: @user}
    assert_response :redirect

    assert !signed_in?
  end
end