require 'test_helper'

class UserTasksControllerTest < ActionController::TestCase
  setup do
    @user_task = user_tasks(:one)
  end

  # test "should get index" do
  #   signin User.first
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:user_tasks)
  # end

  test "should not get index without sign in" do
    get :index
    assert_response :redirect # 302
  end

  test "should not get new without sign in" do
    get :new
    assert_response :redirect
  end

  test "should not create user_task without sign in" do
    post :create, user_task: { description: @user_task.description, due: @user_task.due }
    assert_response :redirect
  end

  test "should not show user_task without sign in" do
    get :show, id: @user_task
    assert_response :redirect
  end

  test "should not get edit without sign in" do
    get :edit, id: @user_task
    assert_response :redirect
  end

  test "should not update user_task without sign in" do
    patch :update, id: @user_task, user_task: { description: @user_task.description, due: @user_task.due }
    assert_response :redirect
  end

  test "should no destroy user_task without sign in" do
    delete :destroy, id: @user_task
    assert_response :redirect
  end
end
