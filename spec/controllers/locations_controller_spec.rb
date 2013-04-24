require 'spec_helper'

describe LocationsController do
  before(:each) do
    @location = Fabricate(:location)
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create location" do
    expect{post :create, location: { category: @location.category, name: @location.name }}.to change{Location.count}.by(1)
    
    assert_redirected_to location_path(assigns(:location))
  end

  it "should show location" do
    get :show, id: @location
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  it "should update location" do
    put :update, id: @location, location: { category: @location.category, name: @location.name }
    assert_redirected_to location_path(assigns(:location))
  end

  it "should destroy location" do
    expect{delete :destroy, id: @location}.to change{Location.count}.by(-1)  

    assert_redirected_to locations_path
  end
end
