require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:Bob)

    user = users(:Tom)
    sign_in user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create user" do
    params = {email: "test@email", password: "test"}
    post :create, user: params

    assert_response :redirect

    user = User.find_by_email(params[:email])
    assert_not_nil user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, {id: @user.id}
    assert_response :success
  end

  test "should update user" do
    params = {email: "test@email", password: "test"}
    
    post :update, user: params, id: @user.id
    assert_response :redirect
    
    @user.reload
    assert_equal params[:email], @user.email
  end

  test "should destroy user" do
    delete :destroy, {id: @user}
    assert_response :redirect
    
    assert !User.exists?(@user)
  end
end