require 'test_helper'

class PetOwnersControllerTest < ActionController::TestCase
  setup do
    @pet_owner = pet_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_owner" do
    assert_difference('PetOwner.count') do
      post :create, pet_owner: { adopted_on: @pet_owner.adopted_on, pet_id: @pet_owner.pet_id, pet_name: @pet_owner.pet_name, user_id: @pet_owner.user_id }
    end

    assert_redirected_to pet_owner_path(assigns(:pet_owner))
  end

  test "should show pet_owner" do
    get :show, id: @pet_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_owner
    assert_response :success
  end

  test "should update pet_owner" do
    put :update, id: @pet_owner, pet_owner: { adopted_on: @pet_owner.adopted_on, pet_id: @pet_owner.pet_id, pet_name: @pet_owner.pet_name, user_id: @pet_owner.user_id }
    assert_redirected_to pet_owner_path(assigns(:pet_owner))
  end

  test "should destroy pet_owner" do
    assert_difference('PetOwner.count', -1) do
      delete :destroy, id: @pet_owner
    end

    assert_redirected_to pet_owners_path
  end
end
