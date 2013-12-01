class EquipsController < ApplicationController
  # GET /equips
  # GET /equips.json
  def index
#    @user = User.find_by_vname(params[:user_id])
#    @petowners = @user.petowners.all
#    @equips = Equip.all
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @equips = @petowner.equips.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equips }
    end
  end

  # GET /equips/1
  # GET /equips/1.json
  def show
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @equip = Equip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equip }
    end
  end

  # GET /equips/new
  # GET /equips/new.json
  def new
#    @equip = Equip.new
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @equip = @petowner.equips.build
    @equip.inventory_id = params[:inventory_id]
  end

  # GET /equips/1/edit
  def edit
    @equip = Equip.find(params[:id])
  end

  # POST /equips
  # POST /equips.json
  def create
#    @equip = Equip.new(params[:equip])
     #@selectpet = params[:petowner][:user_id]
     
     @selectpet = params[:pickpet2][:petoid2]
     @petowner = Petowner.find_by_id(@selectpet)
      puts "*"*100   
      puts :inventory_id
	@itempick=params[:itempick]
  @inventory = Inventory.find_by_id(@itempick)
#     puts "The value of inventory.id #{inventory.id}"
 #    puts "The value of inventory_id #{inventory_id}"
     #puts "The value of inventory.id #{@inventory.id}"
puts "The value of pickpet2 = #{@pickpet2}" 
puts "The value of inventory_id #{@inventory_id}"
     puts "The value of selectpet is #{@selectpet}"
     puts "The value of inventory = #{@inventory}"
     puts "The value of petowner = #{@petowner.id}"
     puts "The value of itempick = #{@itempick}"

     @item = Item.find_by_id(@inventory.item_id)
     #@equip = @petowner.equips.new(params[:equip])
     @equip = @petowner.equips.build
     @equip.inventory_id = @inventory.id
     if @equip.inventory.item.manyuses?
        if @equip.save
           @inventory.equipped = true
           @inventory.save
           redirect_to petowner_equips_path(@petowner)
        else
           redirect_to user_inventories_path(@petowner.user.vname)
        end
     else
        #@leftoverpotion = @inventory.item.hp+@petowner.hp
        if @inventory.item.hp+@petowner.hp > @petowner.hp_max
           @petowner.hp = @petowner.hp_max
           #@petowner.hp+=@inventory.item.hp
        else
           @petowner.hp+=@inventory.item.hp
        end
        @petowner.save
        #raise "I may be used only once!"
        @inventory.destroy
        redirect_to user_inventories_path(@petowner.user.vname)
     end
  end

  # PUT /equips/1
  # PUT /equips/1.json
  def update
    @equip = Equip.find(params[:id])

    respond_to do |format|
      if @equip.update_attributes(params[:equip])
        format.html { redirect_to @equip, notice: 'Equip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equips/1
  # DELETE /equips/1.json
  def destroy
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @equip = Equip.find(params[:id])
    @inventory = Inventory.find(@equip.inventory_id)
    @inventory.equipped = false
    @inventory.save
    @equip.destroy

    respond_to do |format|
      format.html { redirect_to petowner_equips_url }
      format.json { head :no_content }
    end
  end
end
