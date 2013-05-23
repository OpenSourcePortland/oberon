class ShopsController < ApplicationController

  def index
    @shops = Shop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  def show
    @shop = Shop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @shop = Shop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(params[:shop])

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Shop was successfully created.' }
        format.json { render json: @shop, status: :created, location: @shop }
      else
        format.html { render action: "new" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @shop = Shop.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end
  
  def sell_to_character
    shop = Shop.find(params[:id])
    character = Character.first
    item = ShopInventoryItem.find(params[:item_id])
    quantity = params[:quantity].to_i
    respond_to do |format|
      if shop.sell(character, item, quantity)
        format.html { redirect_to shop, notice: 'Item sold to character!' }
      else
        format.html { redirect_to shop, notice: 'Item not sold!' }
      end
    end
  end
  
  def buy_from_character
     shop = Shop.find(params[:id])
     character = Character.first
     item = ShopInventoryItem.find(params[:item_id])
     quantity = params[:quantity].to_i
     respond_to do |format|
       if shop.buy(character, item, quantity)
         format.html { redirect_to shop, notice: 'Item purchased from character!' }
       else
         format.html { redirect_to shop, notice: 'Item not purchased!' }
       end
     end
   end
  
  
end
