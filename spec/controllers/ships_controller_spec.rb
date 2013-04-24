require 'spec_helper'

describe ShipsController do
  before(:each) do
    @ship = Fabricate(:ship)
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ships)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create ship" do
    expect{post :create, ship: { character_id: @ship.character_id, name: @ship.name }}.to change{Ship.count}.by(1)

    assert_redirected_to ship_path(assigns(:ship))
  end

  it "should show ship" do
    get :show, id: @ship
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @ship
    assert_response :success
  end

  it "should update ship" do
    put :update, id: @ship, ship: { character_id: @ship.character_id, name: @ship.name }
    assert_redirected_to ship_path(assigns(:ship))
  end

  it "should destroy ship" do
    expect{delete :destroy, id: @ship}.to change{Ship.count}.by(-1)

    assert_redirected_to ships_path
  end
  
  it "should buy a ship for a character" do
    pending
  end
end
