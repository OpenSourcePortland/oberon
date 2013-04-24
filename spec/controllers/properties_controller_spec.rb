require 'spec_helper'

describe PropertiesController do
  before(:each) do
    @property = Fabricate(:property)
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:properties)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create property" do
    expect{post :create, property: { character_id: @property.character_id, location_id: @property.location_id, name: @property.name, output_rate: @property.output_rate, price: @property.price, property_type: @property.property_type, renewable: @property.renewable, resource_count: @property.resource_count}}.to change{Property.count}.by(1)

    assert_redirected_to property_path(assigns(:property))
  end

  it "should show property" do
    get :show, id: @property
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @property
    assert_response :success
  end

  it "should update property" do
    put :update, id: @property, property: { character_id: @property.character_id, location_id: @property.location_id, name: @property.name, output_rate: @property.output_rate, price: @property.price, property_type: @property.property_type, renewable: @property.renewable, resource_count: @property.resource_count }
    assert_redirected_to property_path(assigns(:property))
  end

  it "should destroy property" do
    expect{delete :destroy, id: @property}.to change{Property.count}.by(-1)

    assert_redirected_to properties_path
  end
end
