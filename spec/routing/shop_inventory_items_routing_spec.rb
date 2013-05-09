require "spec_helper"

describe ShopInventoryItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/shop_inventory_items").should route_to("shop_inventory_items#index")
    end

    it "routes to #new" do
      get("/shop_inventory_items/new").should route_to("shop_inventory_items#new")
    end

    it "routes to #show" do
      get("/shop_inventory_items/1").should route_to("shop_inventory_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shop_inventory_items/1/edit").should route_to("shop_inventory_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shop_inventory_items").should route_to("shop_inventory_items#create")
    end

    it "routes to #update" do
      put("/shop_inventory_items/1").should route_to("shop_inventory_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shop_inventory_items/1").should route_to("shop_inventory_items#destroy", :id => "1")
    end

  end
end
