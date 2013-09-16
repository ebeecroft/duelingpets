require 'test_helper'

class PetItemsControllerTest < ActionController::TestCase
  setup do
    @pet_item = pet_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_item" do
    assert_difference('PetItem.count') do
      post :create, pet_item: { id: @pet_item.id, item_id: @pet_item.item_id, petown_id: @pet_item.petown_id, reusable: @pet_item.reusable }
    end

    assert_redirected_to pet_item_path(assigns(:pet_item))
  end

  test "should show pet_item" do
    get :show, id: @pet_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_item
    assert_response :success
  end

  test "should update pet_item" do
    put :update, id: @pet_item, pet_item: { id: @pet_item.id, item_id: @pet_item.item_id, petown_id: @pet_item.petown_id, reusable: @pet_item.reusable }
    assert_redirected_to pet_item_path(assigns(:pet_item))
  end

  test "should destroy pet_item" do
    assert_difference('PetItem.count', -1) do
      delete :destroy, id: @pet_item
    end

    assert_redirected_to pet_items_path
  end
end
