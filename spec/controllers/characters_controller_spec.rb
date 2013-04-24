require 'spec_helper'

describe CharactersController do
  
  before(:each) do
    @character = Fabricate(:character)
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:characters)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create character" do
    expect{post :create, character: { gender: @character.gender, name: @character.name, species: @character.species }}.to change{Character.count}.by(1)

    assert_redirected_to dashboard_path
  end

  it "should show character" do
    get :show, id: @character
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @character
    assert_response :success
  end

  it "should update character" do
    pending
    put :update, id: @character, character: { gender: @character.gender, name: @character.name, species: @character.species }
    assert_redirected_to character_path(assigns(:character))
  end

  it "should destroy character" do
    expect {delete :destroy, id: @character}.to change{Character.count}.by(-1)

    assert_redirected_to characters_path
  end
  
  it "should find user by session" do
    pending
  end
end