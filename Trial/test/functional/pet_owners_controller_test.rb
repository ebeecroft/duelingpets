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
      post :create, pet_owner: { atk: @pet_owner.atk, def: @pet_owner.def, exp: @pet_owner.exp, hp: @pet_owner.hp, hp_max: @pet_owner.hp_max, id: @pet_owner.id, level: @pet_owner.level, name: @pet_owner.name, pet_id: @pet_owner.pet_id, spd: @pet_owner.spd, user_id: @pet_owner.user_id }
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
    put :update, id: @pet_owner, pet_owner: { atk: @pet_owner.atk, def: @pet_owner.def, exp: @pet_owner.exp, hp: @pet_owner.hp, hp_max: @pet_owner.hp_max, id: @pet_owner.id, level: @pet_owner.level, name: @pet_owner.name, pet_id: @pet_owner.pet_id, spd: @pet_owner.spd, user_id: @pet_owner.user_id }
    assert_redirected_to pet_owner_path(assigns(:pet_owner))
  end

  test "should destroy pet_owner" do
    assert_difference('PetOwner.count', -1) do
      delete :destroy, id: @pet_owner
    end

    assert_redirected_to pet_owners_path
  end
end
