class InventoriesController < ApplicationController
  # GET /inventories
  # GET /inventories.json


#PUT    /users/:id(.:format)                                       users#update
  def use
      @user = User.find_by_vname(params[:user_id])
      @inventory = Inventory.find(params[:id])
      @petowner = Petowner.find_by_id(@user.id)
      @petowner.hp += @inventory.item.hp
#      @inventory.destroy
      @inventories = @user.inventories.all
      redirect_to @inventories
  end
  def index
    if !current_user.nil?
    @cuser = User.find_by_vname(current_user.vname)

    #Find the petowners that the user currently has
    @mypets = @cuser.petowners
    end

#    @inventories = Inventory.all
    @user = User.find_by_vname(params[:user_id])
    @inventories = @user.inventories.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory }
    end
  end

  # GET /inventories/new
  # GET /inventories/new.json
  def new
#    @inventory = Inventory.new
    @user = User.find_by_vname(params[:user_id])
    @inventory = @user.inventories.build
    @inventory.item_id = params[:item_id]
    if @inventory.item_id.nil?
       raise "You are a really dumb user"
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory }
    end
  end

  # GET /inventories/1/edit
  def edit
    @inventory = Inventory.find(params[:id])
  end

  # POST /inventories
  # POST /inventories.json
  def create
#    @inventory = Inventory.new(params[:inventory])
#     @item = Item.find_by_id(params[:item][:item_id])
#     @inventory.item = @item
#     @user = User.find_by_id(params[:user][:user_id])
#     @inventory.user = @user
      @user = User.find_by_vname(params[:user_id])
      @inventory = @user.inventories.new(params[:inventory])
      @item = Item.find(@inventory.item_id)
      #@price = @item.cost
      if @inventory.item.cost > @user.money
         redirect_to items_url
         return
      else
         @user.money -= @inventory.item.cost #This should be setting change based on user's money - items price
      end
      #@user.money = @change #This is not changing the users money.
      #raise "What is going on? Why is it not updating money?"
      if @user.save
         sign_in @user
      else
         raise @user.errors.full_messages.to_s
      end
      #@user.update_attributes(params[:money])
      #raise "What is going on? Why is it not updating money?"
      if @inventory.save
         redirect_to @user
      else
         render "new"
      end
  end

  # PUT /inventories/1
  # PUT /inventories/1.json
  def update
    @inventory = Inventory.find(params[:id])

    respond_to do |format|
      if @inventory.update_attributes(params[:inventory])
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @user = User.find_by_vname(params[:user_id])
    @inventory = Inventory.find(params[:id])
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to user_inventories_path(@user) }
      format.json { head :no_content }
    end
  end
end
