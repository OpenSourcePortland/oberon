class ShopInventoryItemsController < ApplicationController
  # GET /shop_inventory_items
  # GET /shop_inventory_items.json
  def index
    @shop_inventory_items = ShopInventoryItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_inventory_items }
    end
  end

  # GET /shop_inventory_items/1
  # GET /shop_inventory_items/1.json
  def show
    @shop_inventory_item = ShopInventoryItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_inventory_item }
    end
  end

  # GET /shop_inventory_items/new
  # GET /shop_inventory_items/new.json
  def new
    @shop_inventory_item = ShopInventoryItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_inventory_item }
    end
  end

  # GET /shop_inventory_items/1/edit
  def edit
    @shop_inventory_item = ShopInventoryItem.find(params[:id])
  end

  # POST /shop_inventory_items
  # POST /shop_inventory_items.json
  def create
    @shop_inventory_item = ShopInventoryItem.new(params[:shop_inventory_item])

    respond_to do |format|
      if @shop_inventory_item.save
        format.html { redirect_to @shop_inventory_item, notice: 'Shop inventory item was successfully created.' }
        format.json { render json: @shop_inventory_item, status: :created, location: @shop_inventory_item }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shop_inventory_items/1
  # PUT /shop_inventory_items/1.json
  def update
    @shop_inventory_item = ShopInventoryItem.find(params[:id])

    respond_to do |format|
      if @shop_inventory_item.update_attributes(params[:shop_inventory_item])
        format.html { redirect_to @shop_inventory_item, notice: 'Shop inventory item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_inventory_items/1
  # DELETE /shop_inventory_items/1.json
  def destroy
    @shop_inventory_item = ShopInventoryItem.find(params[:id])
    @shop_inventory_item.destroy

    respond_to do |format|
      format.html { redirect_to shop_inventory_items_url }
      format.json { head :no_content }
    end
  end
end
