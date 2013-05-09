require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ShopInventoryItemsController do

  # This should return the minimal set of attributes required to create a valid
  # ShopInventoryItem. As you add validations to ShopInventoryItem, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "shop_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShopInventoryItemsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all shop_inventory_items as @shop_inventory_items" do
      shop_inventory_item = ShopInventoryItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:shop_inventory_items).should eq([shop_inventory_item])
    end
  end

  describe "GET show" do
    it "assigns the requested shop_inventory_item as @shop_inventory_item" do
      shop_inventory_item = ShopInventoryItem.create! valid_attributes
      get :show, {:id => shop_inventory_item.to_param}, valid_session
      assigns(:shop_inventory_item).should eq(shop_inventory_item)
    end
  end

  describe "GET new" do
    it "assigns a new shop_inventory_item as @shop_inventory_item" do
      get :new, {}, valid_session
      assigns(:shop_inventory_item).should be_a_new(ShopInventoryItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested shop_inventory_item as @shop_inventory_item" do
      shop_inventory_item = ShopInventoryItem.create! valid_attributes
      get :edit, {:id => shop_inventory_item.to_param}, valid_session
      assigns(:shop_inventory_item).should eq(shop_inventory_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ShopInventoryItem" do
        expect {
          post :create, {:shop_inventory_item => valid_attributes}, valid_session
        }.to change(ShopInventoryItem, :count).by(1)
      end

      it "assigns a newly created shop_inventory_item as @shop_inventory_item" do
        post :create, {:shop_inventory_item => valid_attributes}, valid_session
        assigns(:shop_inventory_item).should be_a(ShopInventoryItem)
        assigns(:shop_inventory_item).should be_persisted
      end

      it "redirects to the created shop_inventory_item" do
        post :create, {:shop_inventory_item => valid_attributes}, valid_session
        response.should redirect_to(ShopInventoryItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shop_inventory_item as @shop_inventory_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShopInventoryItem.any_instance.stub(:save).and_return(false)
        post :create, {:shop_inventory_item => { "shop_id" => "invalid value" }}, valid_session
        assigns(:shop_inventory_item).should be_a_new(ShopInventoryItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShopInventoryItem.any_instance.stub(:save).and_return(false)
        post :create, {:shop_inventory_item => { "shop_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested shop_inventory_item" do
        shop_inventory_item = ShopInventoryItem.create! valid_attributes
        # Assuming there are no other shop_inventory_items in the database, this
        # specifies that the ShopInventoryItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ShopInventoryItem.any_instance.should_receive(:update_attributes).with({ "shop_id" => "1" })
        put :update, {:id => shop_inventory_item.to_param, :shop_inventory_item => { "shop_id" => "1" }}, valid_session
      end

      it "assigns the requested shop_inventory_item as @shop_inventory_item" do
        shop_inventory_item = ShopInventoryItem.create! valid_attributes
        put :update, {:id => shop_inventory_item.to_param, :shop_inventory_item => valid_attributes}, valid_session
        assigns(:shop_inventory_item).should eq(shop_inventory_item)
      end

      it "redirects to the shop_inventory_item" do
        shop_inventory_item = ShopInventoryItem.create! valid_attributes
        put :update, {:id => shop_inventory_item.to_param, :shop_inventory_item => valid_attributes}, valid_session
        response.should redirect_to(shop_inventory_item)
      end
    end

    describe "with invalid params" do
      it "assigns the shop_inventory_item as @shop_inventory_item" do
        shop_inventory_item = ShopInventoryItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShopInventoryItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => shop_inventory_item.to_param, :shop_inventory_item => { "shop_id" => "invalid value" }}, valid_session
        assigns(:shop_inventory_item).should eq(shop_inventory_item)
      end

      it "re-renders the 'edit' template" do
        shop_inventory_item = ShopInventoryItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShopInventoryItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => shop_inventory_item.to_param, :shop_inventory_item => { "shop_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested shop_inventory_item" do
      shop_inventory_item = ShopInventoryItem.create! valid_attributes
      expect {
        delete :destroy, {:id => shop_inventory_item.to_param}, valid_session
      }.to change(ShopInventoryItem, :count).by(-1)
    end

    it "redirects to the shop_inventory_items list" do
      shop_inventory_item = ShopInventoryItem.create! valid_attributes
      delete :destroy, {:id => shop_inventory_item.to_param}, valid_session
      response.should redirect_to(shop_inventory_items_url)
    end
  end

end
