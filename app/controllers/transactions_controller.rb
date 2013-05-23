class TransactionsController < ApplicationController
  
  def create
    find_resources
    Quartermaster.transact(@buyer, @seller, @good, params[:quantity])
  end
  
  
  private
  
  def find_resources
    find_buyer
    find_seller
    find_good
  end
  
  def find_buyer
    if params[:buyer_type] == "character"
      @buyer = Character.find(params[:buyer_id])
    else
      @buyer = Shop.find(params[:buyer_id])
    end
  end
  
  def find_seller
    if params[:seller_type] == "character"
      @seller = Character.find(params[:seller_id])
    else
      @seller = Shop.find(params[:seller_id])
    end
  end
  
  def find_good
    @good = Good.find(params[:good_id])
  end
  
end