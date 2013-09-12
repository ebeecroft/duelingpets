require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, pet: { atk: @pet.atk, cost: @pet.cost, created_by: @pet.created_by, created_on: @pet.created_on, def: @pet.def, description: @pet.description, hp: @pet.hp, id: @pet.id, image: @pet.image, level: @pet.level, p_m_r: @pet.p_m_r, spd: @pet.spd, species_name: @pet.species_name }
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should show pet" do
    get :show, id: @pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet
    assert_response :success
  end

  test "should update pet" do
    put :update, id: @pet, pet: { atk: @pet.atk, cost: @pet.cost, created_by: @pet.created_by, created_on: @pet.created_on, def: @pet.def, description: @pet.description, hp: @pet.hp, id: @pet.id, image: @pet.image, level: @pet.level, p_m_r: @pet.p_m_r, spd: @pet.spd, species_name: @pet.species_name }
    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, id: @pet
    end

    assert_redirected_to pets_path
  end
end
